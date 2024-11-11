import 'package:after_school_app/common/widgets/text_widgets.dart';
import 'package:after_school_app/pages/sign_in/controller/sign_in_controller.dart';
import 'package:after_school_app/pages/sign_in/provider/sign_in_notifier.dart';
import 'package:after_school_app/pages/sign_in/view/widget/sign_in_wigdets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/global_loader/global_loader.dart';
import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textfields.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/utils/colors.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;
  @override
  void initState() {
    _controller = SignInController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(title: 'Login'),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
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
                  iconName: ImageRes.user, hintText: "Enter your email address",
                  func: (value)=> ref.read(signInNotifierProvider.notifier).onUserEmailChange(value),
                  textEditingController: _controller.emailController,

                ),
                const SizedBox(height: 20,),

                appTextField(
                  text: "Password",
                  iconName: ImageRes.lock,
                  hintText: "Enter your password",
                  obscureText: true,
                  func: (value)=> ref.read(signInNotifierProvider.notifier).onPasswordChange(value),
                  textEditingController: _controller.passwordController,
                ),
                const SizedBox(height: 20,),

                //forgot password text
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: textUnderline(),
                ),


                SizedBox(height: 100,),
                //app login button
                Center(child: appButton(
                  buttonName: 'Login',
                  func: () => _controller.handleSignIn(ref),
                )),

                SizedBox(height: 20,),

                //app register button. Its also navigate to sign up page
                Center(child: appButton(
                  buttonName: 'Register',
                  isLogin: false,
                  func: ()=> Navigator.pushNamed(context, "/signUp"),
                ),),

              ],
            ),
          ) : const Center(
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
