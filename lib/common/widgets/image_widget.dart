import 'package:after_school_app/common/utils/colors.dart';
import 'package:after_school_app/common/utils/image_res.dart';
import 'package:flutter/cupertino.dart';

Widget appImage({
  String imagePath = ImageRes.defaultImage,
  double width = 16,
  double height = 16
}){
  return Image.asset(
    imagePath.isEmpty? ImageRes.defaultImage : imagePath,
    width: width,
    height: height,
  );
}

Widget appImageWithColor({
  String imagePath = ImageRes.defaultImage,
  double width = 16,
  double height = 16,
  Color color = AppColors.primaryElement,
}){
  return Image.asset(
    imagePath.isEmpty? ImageRes.defaultImage : imagePath,
    width: width,
    height: height,
    color: color,
  );
}