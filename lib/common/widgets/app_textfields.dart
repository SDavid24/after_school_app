import 'package:after_school_app/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import 'app_shadows.dart';
import 'image_widget.dart';

Widget appTextField({
  TextEditingController? textEditingController,
  String text = "", String iconName = "",
  String hintText = "Type in your info",
  bool obscureText = false,
  void Function(String value)? func,
}){
  return Container(
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        const SizedBox(height: 5,),
        Container(
          width: 335,
          height: 50,
          decoration: appBoxDecorationTextField(),

          child: Row(//row contains icon and text field
            children: [
              //for showing icons
              Container(
                margin: EdgeInsets.only(left: 17),
                child: appImage(imagePath: iconName),
              ),

              appTextFieldOnly(textEditingController: textEditingController, hintText: hintText, obscureText: obscureText, func: func)

            ],

          ),
        )
      ],
    ),
  );
}

Widget appTextFieldOnly({
  TextEditingController? textEditingController,
  String hintText = "Type in your info",
  double width = 280, double height = 50,
  bool obscureText = false,
  void Function(String value)? func,
}){
  return Container(
    width: 280,
    height: 50,
    child: TextField(
      controller: textEditingController,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5.0, left: 10),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        //default border is the border outlook when no input is ongoing
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),

        //focusedBorder is the border outlook when input is ongoing
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),

        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),

      ),
      onChanged: (value) => func!(value),
      maxLines: 1,
      autocorrect: false,
      obscureText: obscureText, //it's false by default
    ),
  );
}