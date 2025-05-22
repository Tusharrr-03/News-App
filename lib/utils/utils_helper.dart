import 'package:flutter/material.dart';
import 'package:news_app_ui/Constants/appConst.dart';

TextField mTextField({TextEditingController? mController , String? mHintText , Widget? mPrefixIcon}){
  return TextField(
    controller: mController,
    decoration: InputDecoration(
      hintText: mHintText,
      hintStyle: mTextStyle12(),
      prefixIcon: mPrefixIcon,
      filled: true,
      fillColor: AppConstants.textFiledColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

TextStyle mTextStyle12({Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal}){
  return TextStyle(
    fontSize: 12,
    fontWeight: mFontWeight,
    color:mColor,
  );
}

TextStyle mTextStyle16({Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal}){
  return TextStyle(
    fontSize: 16,
    fontWeight: mFontWeight,
    color:mColor,
  );
}

TextStyle mTextStyle22({Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal}){
  return TextStyle(
    fontSize: 22,
    fontWeight: mFontWeight,
    color:mColor,
  );
}

TextStyle mTextStyle32({Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal}){
  return TextStyle(
    fontSize: 32,
    fontWeight: mFontWeight,
    color:mColor,
  );
}