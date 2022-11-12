import 'package:d8er1/logic/create_profile/create_profile_bloc.dart';
import 'package:d8er1/ui/componet/buttonWidget.dart';
import 'package:d8er1/ui/utills/input_deco.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProfile extends StatelessWidget {
  CreateProfile({Key? key, this.state}) : super(key: key);

  dynamic state;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Male';
    String? number;
    String? firstname;
    String? lastname;
    String? location;

    TextEditingController _controller =
        TextEditingController(text: '$firstname');
    TextEditingController _controller1 =
        TextEditingController(text: '$lastname');
    TextEditingController _controller2 = TextEditingController(text: '$number');
    TextEditingController _controller3 =
        TextEditingController(text: '$location');
    TextEditingController _controller4 =
    TextEditingController(text: '');
    dropdownValue = 'Male';

    return SafeArea(
      child: BlocProvider(
        create: (context) => CreateProfileBloc(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            foregroundColor: const Color(0xff12122a),
            shadowColor: Colors.white,
            centerTitle: true,
          ),
          body: BlocConsumer<CreateProfileBloc, CreateProfileState>(
            listener: (context, state) async {
              // String token = '';
              if (state is CreateProfileLoaded) {

                Navigator.of(context).pushNamed("/Profile");
              } else if (state is Error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message!)));
              }
            },
            builder: (context, state) {
              if (state is CreateProfileLoading) {
                return Container(
                    color: Colors.transparent,
                    child: Dialog(
                      // The background color
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            // The loading indicator
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 15,
                            ),
                            // Some text
                            Text('Loading...')
                          ],
                        ),
                      ),
                    ));
              }
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.manual,
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _controller != null ? _controller4 :_controller1,
                          decoration:  buildInputDecoration(
                            hintText: 'firstname',
                            icon: const Icon(Icons.person, color: Color(0xff12122a)),
                          ),
                          // this acts as validating the values of the form
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            firstname = value;
                            // ignore: avoid_print
                            print(value);
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: _controller1 != null ? _controller4 :_controller1,
                          decoration: buildInputDecoration(
                            hintText: 'lastname',
                            icon: const Icon(Icons.person, color: Color(0xff12122a)),
                          ),
                          // this acts as validating the values of the form
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            lastname = value;
                            // ignore: avoid_print
                            print(value);
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: _controller2 != null ? _controller4 :_controller1,
                          decoration: buildInputDecoration(
                            hintText: '080300000396',
                            icon: const Icon(Icons.phone, color: Color(0xff12122a)),
                          ),
                          // this acts as validating the values of the form
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            number = value;
                            // ignore: avoid_print
                            print(value);
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 40),
                        DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            decoration: buildInputDecoration(
                              icon: const Icon(Icons.male, color: Color(0xff12122a)),
                            ),
                            value: dropdownValue,
                            elevation: 16,
                            style: const TextStyle(
                              color: Color(0xff12122a),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            isExpanded: true,
                            alignment: AlignmentDirectional.centerStart,
                            onChanged: (String? newValue) {
                            },
                            validator: (value) =>
                                value == null ? 'field required' : null,
                            items: <String>[
                              'Male',
                              'Female',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: _controller3 != null ? _controller4 :_controller1,
                          decoration: buildInputDecoration(
                            hintText: 'location',
                            icon: const Icon(Icons.map, color: Color(0xff12122a)),
                          ),
                          // this acts as validating the values of the form
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            location = value;
                            // ignore: avoid_print
                            print(value);
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 60),
                        Button(
                          text: 'submit',
                          onPressed: (){},
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
