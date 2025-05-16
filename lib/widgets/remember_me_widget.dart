import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late final loginController= Get.find<LoginController>();
    
    return Row(
      children: [
        ObxValue((data)=> Checkbox(value: data.value, onChanged: (value){
          loginController.isRememberMe.value= value!;
        }),
        loginController.isRememberMe),
        SizedBox(width: 8.0,),
        const Text('Remember me')
      ],
    );
  }
}
