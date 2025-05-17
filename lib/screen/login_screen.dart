import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../routes/routes.dart';
import '../widgets/remember_me_widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController loginController;
  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
          child: Column(
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
              TextFormField(
                controller: loginController.email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: loginController.password,
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
                if(_formKey.currentState!.validate()){
                  LoginController.instance.loginUser(loginController.email.text.trim(), loginController.password.text.trim());
                }
              }, child: const Text("Login")),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: double.infinity, child: OutlinedButton(onPressed: (){
                Get.offAllNamed(Routes.signupScreen);
              }, child: const Text("Create Account")),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
