import 'package:d8er1/ui/componet/buttonWidget.dart';
import 'package:d8er1/ui/componet/drop_button.dart';
import 'package:d8er1/ui/utills/input_deco.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ShareData extends StatefulWidget {
   ShareData({Key? key}) : super(key: key);

  @override
  State<ShareData> createState() => _ShareDataState();
}

class _ShareDataState extends State<ShareData> {
  final formKey = GlobalKey<FormState>();

  final txRef = const Uuid().v1();

  String? dropdown;
  List? statesList;
  String? username,username1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: buildInputDecoration(
                    hintText: 'username',
                    icon: const Icon(Icons.person, color: Color(0xff12122a)),
                  ),
                  // this acts as validating the values of the form
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill this field';
                    }
                    if (value == username1){
                      return 'Can send to self';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    username = value;
                    // ignore: avoid_print
                    print(value);
                  },

                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 50,),
                DropButton(
                  hint: 'Select Data Plan',
                  text: '',
                  item: statesList?.map((tt) {
                    var ts = tt['Amount'].toString();
                    return DropdownMenuItem<String>(
                      value: tt['Amount'].toString(),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('$ts GB'),
                    );

                  }).toList() ?? [],
                ),

                const SizedBox(height: 50,),

                Button(
                  text: 'SHARE DATA',
                  onPressed: () {  },

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
