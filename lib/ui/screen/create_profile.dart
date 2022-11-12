import 'package:d8er1/logic/create_profile/create_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProfile extends StatelessWidget {
  CreateProfile({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Male';
    String? number;
    String? firstname;
    String? lastname;
    String? gender;
    String? location;

    TextEditingController _controller =
        TextEditingController(text: '$firstname');
    TextEditingController _controller1 =
        TextEditingController(text: '$lastname');
    TextEditingController _controller2 = TextEditingController(text: '$number');
    TextEditingController _controller3 =
        TextEditingController(text: '$location');
    dropdownValue = '$gender';

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
                // token = state.user.token.toString();
                // final data = await BlocProvider
                //     .of<UserInfoBloc>(context)
                //     .loginRepository
                //     .userInfo
                //     .fetchData(token: token);
                // context.read<UserInfoBloc>().emit(UserInfoLoaded(data));

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
                          decoration: const InputDecoration(
                            hintText: 'firstname',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff3f4961), width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff12122a), width: 2.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff12122a),
                                  width: 2.0,
                                  style: BorderStyle.solid),
                            ),
                            hintStyle: TextStyle(color: Color(0xff12122a)),
                            prefixIcon:
                                Icon(Icons.person, color: Color(0xff12122a)),
                          ),
                          // this acts as validating the values of the form
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
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
                          decoration: const InputDecoration(
                            hintText: 'lastname',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff3f4961), width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff12122a), width: 2.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff12122a),
                                  width: 2.0,
                                  style: BorderStyle.solid),
                            ),
                            hintStyle: TextStyle(color: Color(0xff12122a)),
                            prefixIcon:
                                Icon(Icons.person, color: Color(0xff12122a)),
                          ),
                          // this acts as validating the values of the form
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
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
                          decoration: const InputDecoration(
                            hintText: '080300000396',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff3f4961), width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff12122a), width: 2.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff12122a),
                                  width: 2.0,
                                  style: BorderStyle.solid),
                            ),
                            hintStyle: TextStyle(color: Color(0xff12122a)),
                            prefixIcon:
                                Icon(Icons.phone, color: Color(0xff12122a)),
                          ),
                          // this acts as validating the values of the form
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
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
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff3f4961), width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff12122a), width: 2.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff12122a),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                              ),
                              prefixIcon:
                                  Icon(Icons.male, color: Color(0xff12122a)),
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
                              gender = newValue;
                            },
                            validator: (value) =>
                                value == null ? 'field required' : null,
                            items: <String>[
                              'Male',
                              'Female',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                                alignment: AlignmentDirectional.centerStart,
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'location',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff3f4961), width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff12122a), width: 2.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff12122a),
                                  width: 2.0,
                                  style: BorderStyle.solid),
                            ),
                            hintStyle: TextStyle(color: Color(0xff12122a)),
                            prefixIcon:
                                Icon(Icons.map, color: Color(0xff12122a)),
                          ),
                          // this acts as validating the values of the form
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(580, 55),
                            primary: const Color(0xff12122a),
                            side: const BorderSide(),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                          onPressed: () {},

                          child: const Text(
                            'submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          // this is the styling for the button
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
