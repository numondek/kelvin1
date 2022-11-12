import 'package:flutter/material.dart';

class Button extends StatelessWidget {
   Button({Key? key, required this.onPressed, this.text}) : super(key: key);
  void Function() onPressed;
  String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(580, 55),
        primary: const Color(0xff12122a),
        side: const BorderSide(),
        shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(6)),
        ),
      ),
      onPressed: onPressed,

      child:  Text(
        text!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
      // this is the styling for the button
    );
  }
}
