import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelper {
  static CustomTextField(TextEditingController controller, String text,
      IconData iconData,) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.w))),
      ),
    );
  }

  static CustomButton(VoidCallback callback, String buttonname) {
    return Container(
      height: 45.h,
      width: 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Center(
          child: Text(
        buttonname,
        style: TextStyle(fontSize: 14.sp),
      )),
    );
  }

  static CustomText(String text, double fontsize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(fontSize: fontsize, fontWeight: fontWeight),
    );
  }
  static CustomSnackbar(String text, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Colors.blue.withOpacity(.8),
    ));
  }
}
