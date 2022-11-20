import 'package:flutter/material.dart';

 buildInputDecoration({String? hintText, Icon? icon, Widget? suffixIcon}) {
   final String? ht = hintText;
   // final icon = Icon(Icons.person, color: Color(0xff12122a));
  return  InputDecoration(
    hintText: ht,
    label: Text(ht!),
    labelStyle: const TextStyle(color: Color(0xff12122a)),
    hintStyle: const TextStyle(color: Color(0xff12122a)),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
          color: Color(0xff3f4961),
          width: 2.0,
          style: BorderStyle.solid),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
          color: Color(0xff12122a),
          width: 2.0,
          style: BorderStyle.solid),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
          color: Color(0xff12122a),
          width: 2.0,
          style: BorderStyle.solid),
    ),
    prefixIcon: icon ?? const Icon(Icons.person, color: Color(0xff12122a)),
      suffixIcon: suffixIcon,
  );
}


 buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    foregroundColor: const Color(0xff12122a),
    shadowColor: Colors.white,
    centerTitle: true,
  );
}