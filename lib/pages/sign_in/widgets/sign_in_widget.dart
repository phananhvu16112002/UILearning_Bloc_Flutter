import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 1.0,
        )),
    title: Center(
      child: Text(
        'Log In',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Center(
    child: Container(
        margin: EdgeInsets.only(top: 30.h, bottom: 20.h),
        padding: EdgeInsets.only(left: 40.w,right: 40.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _reusableIcons('google'),
            _reusableIcons('apple'),
            _reusableIcons('facebook')
          ],
        )),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
      onTap: () {},
      child: Container(
          width: 40.w,
          height: 40.w,
          child: Image.asset("assets/icons/${iconName}.png")));
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(text,
        style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp,
        )),
  );
}

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryFourElementText),
      ),
      child: Row(
        children: [
          Container(
              width: 16.w,
              margin: EdgeInsets.only(left: 17.w),
              height: 16.w,
              child: Image.asset("assets/icons/${iconName}.png")),
          Container(
            width: 270.w,
            height: 50.w,
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle:
                      TextStyle(color: AppColors.primarySecondaryElementText)),
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: 'Avenir',
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
            ),
          )
        ],
      ));
}

Widget forgotPassword() {
  return Container(
    width: 260.w,
    height: 40.w,
    child: GestureDetector(
        onTap: () {},
        child: Text(
          'Forgot Password',
          style: TextStyle(
              color: AppColors.primaryText,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryText,
              fontSize: 12.sp),
        )),
  );
}

Widget buildLoginandRegButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        width: 325.w,
        height: 50.h,
        margin: EdgeInsets.only(
            left: 25.w, right: 25.w, top: buttonType == "login" ? 40.h : 20.h),
        decoration: BoxDecoration(
            color: buttonType == "login"
                ? AppColors.primaryElement
                : AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.w),
            border: Border.all(
                color: buttonType == "login"
                    ? Colors.transparent
                    : AppColors.primaryFourElementText),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                  color: Colors.grey.withOpacity(0.1))
            ]),
        child: Center(
            child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: buttonType == "login"
                  ? AppColors.primaryBackground
                  : AppColors.primaryText),
        ))),
  );
}
