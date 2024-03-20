import 'package:ecommerce_app/Screens/Signup/Models/signupmodel.dart';
import 'package:ecommerce_app/Screens/Signup/cubits/signupcubit.dart';
import 'package:ecommerce_app/Screens/Signup/cubits/signupstates.dart';
import 'package:ecommerce_app/Widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  signUp(String fname, String lname, String email, String password,
      String phoneno) async {
    if (fname == "" &&
        lname == "" &&
        email == "" &&
        password == "" &&
        phoneno == "") {
      return UiHelper.CustomSnackbar("Enter Required Field's", context);
    } else {
      context.read<SignUpCubit>().postData(SignUpModel(
          password: passwordController.text.toString(),
          lastname: lastnameController.text.toString(),
          firstname: firstnameController.text.toString(),
          email: emailController.text.toString(),
          phonenumber: phoneController.text.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpLoadedStates) {
          UiHelper.CustomSnackbar(state.accesstoken.toString(), context);
        } else if (state is SignUpErrorStates) {
          UiHelper.CustomSnackbar(state.errormsg.toString(), context);
        }
      },
      builder: (context, state) {
        if (state is SignUpLoadingStates) {
          return Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70.h,
              ),
              UiHelper.CustomText("Sign Up", 24.sp, FontWeight.bold),
              SizedBox(
                height: 20.h,
              ),
              UiHelper.CustomTextField(
                emailController,
                "Enter Email",
                Icons.mail,
              ),
              UiHelper.CustomTextField(
                passwordController,
                "Enter Password",
                Icons.password,
              ),
              UiHelper.CustomTextField(
                firstnameController,
                "Enter First Name",
                Icons.person,
              ),
              UiHelper.CustomTextField(
                lastnameController,
                "Enter Last Name",
                Icons.person,
              ),
              UiHelper.CustomTextField(
                phoneController,
                "Enter Phone Number",
                Icons.phone,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    signUp(
                        firstnameController.text.toString(),
                        lastnameController.text.toString(),
                        emailController.text.toString(),
                        passwordController.text.toString(),
                        phoneController.text.toString());
                  },
                  child: Text("Sign Up"))
            ],
          ),
        );
      },
    )));
  }
}
