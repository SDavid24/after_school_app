import 'package:after_school_app/common/global_loader/global_loader.dart';
import 'package:after_school_app/common/utils/constants.dart';
import 'package:after_school_app/global.dart';
import 'package:after_school_app/main.dart';
import 'package:after_school_app/pages/sign_in/provider/sign_in_notifier.dart';
import 'package:after_school_app/pages/sign_in/repo/sign_in_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/models/user.dart';
import '../../../common/widgets/popup_messages.dart';

class SignInController{

  //To temporarily save the inputted text when sign up button is clicked so it doesn't get wiped off
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleSignIn(WidgetRef ref) async{
    var state = ref.watch(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if(state.email.isEmpty || !state.email.contains("@")){
      toastInfo("Input a valid email");
      return;
    }

    if(state.password.isEmpty){
      toastInfo("Input your password");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential = await SignInRepo.firebaseSignIn(email, password);

      if (credential.user == null) {
        toastInfo("User not found");
        return;
      }
      if (!credential.user!.emailVerified) {
        toastInfo("You must verify your email address first");
        return;
      }

      var user = credential.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity(
            avatar: photoUrl,
            email: email,
            name: displayName,
            open_id: id,
            type: 1
        );
        asyncPostAllData(loginRequestEntity);
        if (kDebugMode) {
          print('User logged in!');
        }
      } else {
        toastInfo("Login error");
      }

    } on FirebaseAuthException catch(e) {

      //show sign up page one more time
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);

      if(e.code=='invalid-credential') {
        toastInfo("Either email or password is incorrect. Kindly check and renter the correct details");

      }else if(e.code=='network-request-failed') {
        toastInfo(
            "Network request error. Kindly check your internet connection");
      }else{
        toastInfo("Error logging in. Kindly try again later");
      }

    }catch(e){
      toastInfo("Error logging in. Kindly try again later");
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);


  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity){
    //We need to talk to server

    //have a local storage
    try{
      //try to remember user info
      Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, '{"name": "David"}');
      Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");

      //navigator.push(MaterialPageRoute(builder: (BuildContext context) => Container()));
      navKey.currentState?.pushNamedAndRemoveUntil("/application", (route) => false);
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }

    //redirect to a new page

  }

}