import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//positional optional parameter
//In this type, you don't need to pass as 'msg = "code learning"'. You can just pass in the text straight up
//toastInfo([String msg = ""]){

toastInfo(String msg, {Color background = Colors.blue, Color textColor = Colors.white}){
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: background,
    textColor: textColor,
    fontSize: 16

  );
}