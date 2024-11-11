import 'package:after_school_app/common/global_loader/global_loader.dart';
import 'package:after_school_app/pages/sign_up/controller/sign_up_controller.dart';
import 'package:after_school_app/common/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textfields.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_widgets.dart';
import '../provider/register_notifier.dart';


class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  //We are using ConsumerStatefulWidget so we can get access to this ref before it builds
  late SignUpController _controller;
  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(title:'Sign Up'),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
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
                  iconName: ImageRes.user, hintText: "Enter your user name",
                  func: (userName) => ref.read(registerNotifierProvider.notifier).onUserNameChange(userName),
                ),
                const SizedBox(height: 20,),

                appTextField(
                  text: "Email",
                  iconName: ImageRes.user, hintText: "Enter your email address",
                  func: (email) => ref.read(registerNotifierProvider.notifier).onUserEmailChange(email),
                ),
                const SizedBox(height: 20,),

                appTextField(
                  text: "Password",
                  iconName: ImageRes.lock,
                  hintText: "Enter your password",
                  obscureText: true,
                  func: (password) => ref.read(registerNotifierProvider.notifier).onPasswordChange(password),
                ),
                const SizedBox(height: 20,),

                appTextField(
                  text: "Confirm Password",
                  iconName: ImageRes.lock,
                  hintText: "Enter your confirmed password",
                  obscureText: true,
                  func: (rePassword) => ref.read(registerNotifierProvider.notifier).onRePasswordChange(rePassword),

                ),
                const SizedBox(height: 20,),

                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: text14Normal(
                      text: 'By creating an account, you have agreed to our terms and conditions'
                  ),), //more login options message

                const SizedBox(height: 60,),
                //app login button
                Center(child: appButton(buttonName: 'Register', func: () => _controller.handleSignUp())),

              ],
            ),
          )
          : const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
              color: AppColors.primaryElement,
            ),
          ),
        ),
      ),
    );
  }
}