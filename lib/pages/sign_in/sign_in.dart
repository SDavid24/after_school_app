import 'package:after_school_app/common/widgets/text_widgets.dart';
import 'package:after_school_app/pages/sign_in/sign_in_wigdets.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';
import '../../common/widgets/button_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(text: 'Login'),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                thirdPartyLogin(), //top login buttons
                Center(child: text14Normal(
                  text: 'Or use your email account to login'
                )), //more login options message
                const SizedBox(height: 50,),
            
                appTextField(
                  text: "Email",
                  iconName: "assets/icons/user.png", hintText: "Enter your email address"
                ),
                const SizedBox(height: 20,),
            
                appTextField(text: "Password", iconName: "assets/icons/lock.png", hintText: "Enter your password", obscureText: true),
                const SizedBox(height: 20,),
            
                //forgot password text
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: textUnderline(),
                ),

            
                SizedBox(height: 100,),
                //app login button
                Center(child: appButton(buttonName: 'Login')),
            
                SizedBox(height: 20,),
            
                //app register button. Its also navigate to sign up page
                Center(child: appButton(
                  buttonName: 'Register',
                  isLogin: false,
                  func: ()=> Navigator.pushNamed(context, "/signUp"),
                ),),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
