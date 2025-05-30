
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:note_ass/repository/authentication_repository/exeptions/signup_email_password_failure.dart';
import 'package:note_ass/screen/splash_screen.dart';

import '../../routes/routes.dart';
import '../../screen/home_screen.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?>firebaseUser;

  @override
  void onReady() {
    firebaseUser= Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

  }
  _setInitialScreen(User? user) {
    user == null? Get.offAllNamed(Routes.splash) : Get.offAllNamed(Routes.loginScreen);
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email:email, password: password);
      Get.offAllNamed(Routes.homeScreen);
    }on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch(_){
      const ex = SignUpWithEmailPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email:email, password: password);
      Get.offAllNamed(Routes.homeScreen);
    }on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch(_){
      const ex = SignUpWithEmailPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async=> await _auth.signOut();
}