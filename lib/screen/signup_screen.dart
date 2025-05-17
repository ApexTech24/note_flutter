import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_ass/controller/signup_controller.dart';
import '../routes/routes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final SignUpController signUpController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    signUpController=Get.put(SignUpController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('SignUp',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              TextFormField(
                controller: signUpController.name,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: signUpController.email,
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
                controller: signUpController.password,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 16.0,
              ),

              FilledButton(onPressed: () {
                if(_formKey.currentState!.validate()){
                  SignUpController.instance.registerUser(signUpController.email.text.trim(), signUpController.password.text.trim());
                }

              }, child: const Text("SignUp")),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: double.infinity, child: OutlinedButton(onPressed: (){
                Get.offAllNamed(Routes.loginScreen);
              }, child: const Text("SignIn")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
