class SignUpWithEmailPasswordFailure{
  final String message;

  const SignUpWithEmailPasswordFailure([this.message="An unknown error occurred!"]);

  factory SignUpWithEmailPasswordFailure.code(String code){
    switch(code){
      case'weak-password' :
        return const SignUpWithEmailPasswordFailure("Please enter a strong password");
        case'invalid-email' :
        return const SignUpWithEmailPasswordFailure("Please enter a valid email!");
        case'email-already-in-used' :
        return const SignUpWithEmailPasswordFailure("An account already exists for that email!");
        case'operation-not-allow' :
        return const SignUpWithEmailPasswordFailure("operation is not allow!");
        case'user-disable' :
        return const SignUpWithEmailPasswordFailure("This user has been disable!");
        default:
          return const SignUpWithEmailPasswordFailure();
    }
  }
}