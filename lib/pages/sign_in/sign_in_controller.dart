import 'package:bloc_app/pages/sign_in/bloc/signin_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBlocs>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty){
          //
        }
        if (password.isEmpty){
          //
        }
        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress, password: password); 
          if (credential.user ==null){
            //
          }
          if (!credential.user!.emailVerified){
            //
          }

          var user = credential.user;
          if (user != null){
            //We got verified user from firebase
          }
          else{
            //We have error setting from firebase
          }
        } catch (e) {
          print(e); 
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
