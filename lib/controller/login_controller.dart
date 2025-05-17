import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController{
  RxBool isRememberMe= false.obs;
  static LoginController get instance => Get.find();

  final email=TextEditingController();
  final password=TextEditingController();

  void loginUser(String email, String password){
    AuthenticationRepository.instance.signInWithEmailAndPassword(email, password);
  }
}