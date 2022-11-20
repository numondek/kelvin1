import 'dart:math';

import 'package:d8er1/ui/utills/input_deco.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';



class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Pin();
  }
}




class Pin extends StatefulWidget {
  const Pin({Key? key}) : super(key: key);

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  var code;
  main() async {
    var rng = Random();

    String username1 = 'Support@d8er-app.com';
    String password1 = 'Numonde@1';
    setState(() {
      code = rng.nextInt(900000) + 100000;
    });

    // final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    final smtpServer = SmtpServer('smtp.titan.email',
      port: 465,
      ssl: true,
      username: username1,
      password: password1,
    );
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username1, 'D8er')
      ..recipients.add('$email')
    // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    // ..bccRecipients.add(const Address('numondekelvin@gmail.com'))
      ..subject = 'D8er Otp'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<p>Please use the OTP code: $code to change your pin</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent: $e');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();


  }
  void fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      pin = prefs.getString('Pin');
      email = prefs.getString('email');
      main();
    });
  }

  String? pin, email;
  @override
  Widget build(BuildContext context) {
    String? requiredNumber = code.toString();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            reverse: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 700,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.6,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 50.0),
                        child: Image(
                          image: AssetImage('assets/email-verification.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Verification Code',
                    style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50.0),
                  const Text(
                    'Enter the code sent to email',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(height: 30.0),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    onChanged: (value) {
                      print(value);
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(6),
                      fieldHeight: 45,
                      fieldWidth: 45,
                      inactiveColor: Colors.grey,
                      activeColor: const Color(0xff12122a),
                      selectedColor: const Color(0xff3f4961),

                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onCompleted: (value){
                      if(value == requiredNumber){
                        print('valid pin');
                      } else {
                        print('invalid pin');
                      };
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Otp(),));

                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),


                  InkWell(
                    onTap: () {
                      main();
                    },
                    child: Text(
                      "Resend Otp",
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 15,

                      ),
                    ),
                  ),

                ],
              ),

            ].reversed.toList(),
          ),
        ),
      ),
    );
  }
}

