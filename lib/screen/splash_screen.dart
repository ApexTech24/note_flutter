import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState()=> _SplashScreen();
}
class _SplashScreen extends State<SplashScreen>{

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Get.offAllNamed(Routes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const[
          Center(
            child: Text('Splash Screen'),
          ),
          SizedBox(height: 20,),
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}