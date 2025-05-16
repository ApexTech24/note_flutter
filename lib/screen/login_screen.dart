import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../widgets/remember_me_widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final LoginController loginController;

  @override
  void initState(){
    super.initState();
    loginController=Get.put(LoginController());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("login Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Login',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 16.0,
            ),
            RememberMeWidget(),

            FilledButton(onPressed: () {
              final String email= emailController.text;
              final String password= passwordController.text;

            }, child: const Text("Login")),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              width: double.infinity, child: OutlinedButton(onPressed: (){}, child: const Text("Create Account")),
            ),
          ],
        ),
      ),
    );
  }
}
