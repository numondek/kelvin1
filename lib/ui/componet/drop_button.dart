import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropButton extends StatelessWidget {
  const DropButton({
    Key? key,
    required this.item,
    this.text, this.hint, this.icon,
  }) : super(key: key);
  final List<DropdownMenuItem<String>>? item;
  final String? text, hint;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        decoration:  InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff3f4961), width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff12122a), width: 2.0),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xff12122a), width: 2.0, style: BorderStyle.solid),
          ),
          prefixIcon: icon,
        ),
        hint:  Text(
          hint!,
          style: const TextStyle(
            color: Color(0xff12122a),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        value: text,
        elevation: 16,
        style: const TextStyle(
          color: Color(0xff12122a),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        isExpanded: true,
        alignment: AlignmentDirectional.centerStart,
        onChanged: (String? newValue) {},
        validator: (value) => value == null ? 'field required' : null,
        items: item,
      ),
    );
  }
}
