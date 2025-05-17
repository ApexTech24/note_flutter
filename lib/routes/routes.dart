import 'package:get/get.dart';
import 'package:note_ass/screen/home_screen.dart';
import '../screen/login_screen.dart';
import '../screen/signup_screen.dart';
import '../screen/splash_screen.dart';

class Routes{
  Routes._();
  static const String splash ='/';
  static const String loginScreen ='/LoginScreen';
  static const String signupScreen ='/SignupScreen';
  static const String homeScreen ='/HomeScreen';

  static final routes=<GetPage>[
    GetPage(name: splash, page: ()=> const SplashScreen()),
    GetPage(name: loginScreen, page: ()=> const LoginScreen()),
    GetPage(name: signupScreen, page: ()=> const SignupScreen()),
    GetPage(name: homeScreen, page: ()=> const HomeScreen()),
  ];
}