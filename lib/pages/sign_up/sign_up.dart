import 'package:flutter/material.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';
import '../../common/widgets/button_widget.dart';
import '../../common/widgets/text_widgets.dart';
import '../sign_in/sign_in_wigdets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(text:'Sign Up'),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),

                Center(child: text14Normal(
                    text: 'Enter your details below and sign up for free'
                )), //more login options message
                const SizedBox(height: 50,),

                appTextField(
                    text: "User name",
                    iconName: "assets/icons/user.png", hintText: "Enter your user name"
                ),
                const SizedBox(height: 20,),

                appTextField(
                    text: "Email",
                    iconName: "assets/icons/user.png", hintText: "Enter your email address"
                ),
                const SizedBox(height: 20,),

                appTextField(text: "Password", iconName: "assets/icons/lock.png", hintText: "Enter your password", obscureText: true),
                const SizedBox(height: 20,),

                appTextField(text: "Confirm Password", iconName: "assets/icons/lock.png", hintText: "Enter your confirmed password", obscureText: true),
                const SizedBox(height: 20,),

                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: text14Normal(
                    text: 'By creating an account, you have agreed to our terms and conditions'
                ),), //more login options message

                SizedBox(height: 60,),
                //app login button
                Center(child: appButton(buttonName: 'Register')),

              ],
            ),
          ),
        ),
      ),
    );
  }
}