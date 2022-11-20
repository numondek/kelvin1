import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class PopDialog {
  Future<bool> onWillPop(BuildContext context) async =>
      (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Do you want to Logout?'),
          actions: <Widget>[
            IconsOutlineButton(
              onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
              text: 'NO',
              iconData: Icons.cancel_outlined,
              color: Colors.red,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
            IconsOutlineButton(
              onPressed: () => Navigator.of(context).pop(true), // <-- SEE HERE
              text: 'YES',
              iconData: Icons.done,
              color: Colors.green,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ],
        ),
      )) ??
      false;

  Future<bool> WillPop(
          context, String? Pin, String? Pin1, Function()? send) async =>
      (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Enter Your Pin'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(6),
                  borderWidth: 2,
                  fieldHeight: 40,
                  fieldWidth: 40,
                  inactiveColor: const Color(0xff12122a),
                  activeColor: const Color(0xff12122a),
                  selectedColor: const Color(0xff8296c7),
                ),
                onCompleted: (value) {
                  String? requiredNumber = Pin1;
                  Pin = value;

                  if (value == requiredNumber) {
                    if (kDebugMode) {
                      print('valid pin');
                      Navigator.of(context).pop(true);
                      send;
                    }
                  } else {
                    if (kDebugMode) {
                      print('invalid pin');
                      print(requiredNumber);
                    }
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please fill this field';
                  }
                  if (value != Pin1) {
                    return 'invaid pin';
                  }
                },
                onSaved: (value) {
                  Pin = value;
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
          ],
        ),
      )) ??
      false;
}
