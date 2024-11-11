import 'package:after_school_app/common/utils/colors.dart';
import 'package:after_school_app/common/utils/image_res.dart';
import 'package:after_school_app/common/widgets/app_shadows.dart';
import 'package:after_school_app/common/widgets/app_textfields.dart';
import 'package:flutter/cupertino.dart';

import 'image_widget.dart';

Widget searchBar(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //search text box
      Container(
        width: 280,
        height: 40,
        decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          boxBorder: Border.all(color: AppColors.primaryFourElementText)
        ),
        child: Row(
          children: [
            Container(
              child: appImage(imagePath: ImageRes.searchIcon),
              margin: EdgeInsets.only(left: 17),
            ),
            SizedBox(
              width: 240,
              height: 40,
              child: appTextFieldOnly(width: 240, height: 40, hintText: "Search your course"),

            ),
          ],
        ),
      ),

      SizedBox(width: 10,),
      GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          width: 40,
          height: 40,
          decoration: appBoxShadow(
            boxBorder: Border.all(
              color: AppColors.primaryElement,
            ),
          ),
          child: appImage(imagePath: ImageRes.searchButton),
        ),
      )
      //search  button

    ],
  );
}