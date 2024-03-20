import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_app/Screens/Signup/Models/signupmodel.dart';
import 'package:ecommerce_app/Screens/Signup/cubits/signupstates.dart';
import 'package:ecommerce_app/Screens/Utils/urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignupInitialStates());
  postData(SignUpModel signUpModel) async {
    emit(SignUpLoadingStates());
    try {
      var response = await http.post(Uri.parse(BaseUrls.signupUrl),
          body: jsonEncode({
            "email": signUpModel.email,
            "password": signUpModel.password,
            "phone": signUpModel.phonenumber,
            "f_name": signUpModel.firstname,
            "l_name": signUpModel.lastname
          }),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Map<String, dynamic> responseData = jsonDecode(response.body);
        String accesstoken = responseData['token'];
        prefs.setString("token", accesstoken);
        prefs.setBool("islogin", true);
        log(accesstoken);
        emit(SignUpLoadedStates(accesstoken: accesstoken));
      } else {
        log(response.statusCode.toString());
        emit(SignUpErrorStates(errormsg: response.statusCode.toString()));
      }
    } catch (ex) {
      emit(SignUpErrorStates(errormsg: ex.toString()));
    }
  }
}
