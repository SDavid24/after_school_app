import 'package:after_school_app/common/widgets/app_shadows.dart';
import 'package:after_school_app/common/widgets/image_widget.dart';
import 'package:after_school_app/util/colors.dart';
import 'package:flutter/material.dart';

Widget text24Normal({
  String text = "",
  Color color = AppColors.primaryText
}){
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget text16Normal({
  String text = "",
  Color color = AppColors.primarySecondaryElementText
}){
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget text14Normal({
  String text = "",
  Color color = AppColors.primaryThreeElementText
}){
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget textUnderline({String text = "Forgot password?"}){
  return GestureDetector(
    onTap: (){

    },
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColors.primaryText,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText
      ),
    ),
  );
}

