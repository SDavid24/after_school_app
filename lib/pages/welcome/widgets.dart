
import 'dart:ffi';

import 'package:after_school_app/common/widgets/app_shadows.dart';
import 'package:after_school_app/util/colors.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/text_widgets.dart';

Widget appOnboardingPage(
    PageController controller, {
      String imagePath= "assets/images/reading.png",
      String title = "First see Learning",
      String subTitle = "Forget about paper. All knowledge in one learning",
      int index = 0,


}){
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),

      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(text: subTitle),
      ),
      _nextButton(index, controller),
    ],
  );
}

Widget _nextButton(int index, PageController controller){
  return GestureDetector(
    onTap: (){
      print("index is: $index");

      if(index < 3){
        controller.animateToPage( index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(child: text16Normal(
        text: index < 3 ? "next" : "Get started",
        color: Colors.white,
      )),
    ),
  );
}