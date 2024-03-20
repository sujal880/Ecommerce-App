import 'package:ecommerce_app/Screens/Signup/Models/signupmodel.dart';

abstract class SignUpStates {}

class SignupInitialStates extends SignUpStates {}

class SignUpLoadingStates extends SignUpStates {}

class SignUpLoadedStates extends SignUpStates {
  String accesstoken;
  SignUpLoadedStates({required this.accesstoken});
}

class SignUpErrorStates extends SignUpStates {
  String errormsg;
  SignUpErrorStates({required this.errormsg});
}
