import 'package:get/get.dart';
import '../screen/splash_screen.dart';

class Routes{
  Routes._();
  static const String splash ='/';

  static final routes=<GetPage>[
    GetPage(name: splash, page: ()=> const SplashScreen()),
  ];
}