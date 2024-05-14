import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{


  static void fieldFocusChange(BuildContext context, FocusNode curr, FocusNode next){
    curr.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
  static toastMessage(String msg){
    Fluttertoast.showToast(msg: msg,backgroundColor: Colors.green,textColor: Colors.white);
  }
}