import 'package:bloc_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child:
                          reusableText('Or use your email account to login')),
                  Container(
                    margin: EdgeInsets.only(top: 50.h),
                    padding: EdgeInsets.only(left: 25.h, right: 25.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your email address", "email", "user"),
                        reusableText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your password", "password", "lock"),
                        forgotPassword(),
                        buildLoginandRegButton("Login", "login"),
                        buildLoginandRegButton("Register", "register"),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
