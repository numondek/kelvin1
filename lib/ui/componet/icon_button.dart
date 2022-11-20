import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
   IconButtons({
    Key? key, required this.onTap, this.name, this.icon,
  }) : super(key: key);

  final Function() onTap;
  final String? name;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff252526),style: BorderStyle.solid),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          padding: const EdgeInsets.only(right: 10,left: 10, top: 5, bottom: 5),
          child: Column(
            children:  [
              Icon(icon, color: const Color(0xff023e7d),size: 35,),
              Text(name!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10
                ),)
            ],
          )
      ),
    );
  }
}