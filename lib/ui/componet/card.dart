import 'package:flutter/material.dart';

class LastTransaction extends StatelessWidget {
  const LastTransaction({
    Key? key,
    this.text1,
    this.text2, this.color, required this.icon,
  }) : super(key: key);
  final String? text1, text2;
  final Color? color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
               Text(
                '$text1',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
              Row(
                children:  [
                   Icon(
                    icon,
                    color: color,
                  ),
                  Text(
                    '$text2',
                    style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        color: color,
                        fontSize: 15),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
