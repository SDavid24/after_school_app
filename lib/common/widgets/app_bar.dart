
/*
If you want to have extra spacing(height) right below your app bar.
And you can put a child to customise it how you want
*/
import 'package:after_school_app/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';

AppBar buildAppBar({String text = ""}){
  return AppBar(
    backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),

    ),
    title: text16Normal(text: text, color: AppColors.primaryText),
  );
}