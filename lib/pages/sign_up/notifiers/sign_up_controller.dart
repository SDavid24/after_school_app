
import 'package:after_school_app/pages/sign_up/notifiers/register_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/global_loader/global_loader.dart';
import '../../../common/widgets/popup_messages.dart';

class SignUpController{
  final WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider); //give us access to all the values being filled in the form
  //  var loaderState = ref.read(appLoaderProvider);

    if(state.userName.isEmpty){
      toastInfo("Input a valid username");
      return;
    }

    if(state.email.isEmpty || !state.email.contains("@")){
      toastInfo("Input a valid email");
      return;
    }

    if(state.password.isEmpty){
      toastInfo("Input a valid password and confirm it");
      return;
    }
    if(state.rePassword.isEmpty){
      toastInfo("Kindly confirm your password");
      return;
    }

    if(state.password != state.rePassword){
      toastInfo("Your password doesn't match");
      return;
    }


    //show the loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);

    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: state.email,
        password: state.password,);

      if(kDebugMode){
        print(credential);
      }

      if(credential.user!=null){

        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(state.userName);
        //get server photo url
        //get user photo url
        toastInfo("An email has been sent to verify your account. PLease open that email and ");
        context.pop();
      }

    }catch(e){

    }

    //show sign up page one more time
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);

  }
}