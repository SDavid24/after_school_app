import 'package:after_school_app/common/widgets/app_shadows.dart';
import 'package:after_school_app/common/widgets/text_widgets.dart';
import 'package:after_school_app/common/utils/colors.dart';
import 'package:flutter/material.dart';

Widget appButton({
  double width = 325,
  double height = 50,
  String buttonName = "",
  bool isLogin = true,
  void Function()? func,
}){

  return GestureDetector(

    onTap: func,
    child: Container(
      width: 325,
      height: 50,
      //if login is true send primary color if not set it to white
      decoration: appBoxShadow(
        color: isLogin ? AppColors.primaryElement : Colors.white,
        border: !isLogin ? Border.all(color: AppColors.primaryFourElementText) : null,
      ),
      child: Center(child: text16Normal(
        text: buttonName, color: isLogin? AppColors.primaryBackground : AppColors.primaryText
      ),),
    ),
  );
}