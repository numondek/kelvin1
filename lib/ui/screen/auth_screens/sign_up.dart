import 'package:d8er1/logic/cubit/password_vissible_cubit.dart';
import 'package:d8er1/logic/signup+/sign_up_bloc.dart';
import 'package:d8er1/ui/componet/buttonWidget.dart';
import 'package:d8er1/ui/utills/input_deco.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  String? password1;
  String? email;
  String? username;
  String? _password;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context) => SignUpBloc(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              foregroundColor: const Color(0xff12122a),
              shadowColor: Colors.white,
              centerTitle: true,
            ),
            body: BlocConsumer<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if (state is SignupSuccess) {
                  Navigator.of(context).pushNamed("/Signup");
                } else if (state is SignupError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message!)));
                }
              },
              builder: (context, state) {
                if (state is SignupLoading) {
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
                } else {
                  return SingleChildScrollView(
                    child: Center(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                decoration: buildInputDecoration(
                                  hintText: 'username',
                                  icon: const Icon(Icons.person,
                                      color: Color(0xff12122a)),
                                ),
                                // this acts as validating the values of the form
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please fill this field';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  username = value!;
                                  // ignore: avoid_print
                                  print(value);
                                },
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: 40),
                              TextFormField(
                                decoration: buildInputDecoration(
                                  hintText: 'name@mail.com',
                                  icon: const Icon(Icons.mail,
                                      color: Color(0xff12122a)),
                                ),
                                // this acts as validating the values of the form
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please fill this field';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  email = value!;
                                  // ignore: avoid_print
                                  print(value);
                                },
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: 40),
                              BlocBuilder<PasswordVissibleCubit,
                                  PasswordVissibleState>(
                                builder: (context, state) {
                                  return TextFormField(
                                    decoration: buildInputDecoration(
                                        hintText: '***********',
                                        icon: const Icon(
                                          Icons.lock,
                                          color: Color(0xff12122a),
                                        ),
                                        suffixIcon: IconButton(
                                            icon: state.isPasswordVisible1 as bool
                                                ? const Icon(
                                                Icons.visibility_off)
                                                : const Icon(Icons.visibility),
                                            onPressed: () {
                                              BlocProvider.of<PasswordVissibleCubit>(context).passwordVissible1();
                                            })),

                                    obscureText: state.isPasswordVisible1 as bool,
                                    // to hide the text of this field
                                    validator: (value) {
                                      if (value!.length < 6) {
                                        return 'Password is less than 6';
                                      }
                                      if (password1 != _password) {
                                        return 'Password mismatch';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _password = value!;
                                      print('$_password $password1 kklk');
                                    },
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                  );
                                },
                              ),
                              const SizedBox(height: 40),
                              BlocBuilder<PasswordVissibleCubit, PasswordVissibleState>(
                                builder: (context, state) {
                                  return TextFormField(
                                    decoration: buildInputDecoration(
                                        hintText: 'password',
                                        icon: const Icon(Icons.lock,
                                            color: Color(0xff12122a)),
                                        suffixIcon: IconButton(
                                            icon: state.isPasswordVisible2 as bool
                                                ? const Icon(
                                                Icons.visibility_off)
                                                : const Icon(Icons.visibility),
                                            onPressed: () {
                                              BlocProvider.of<PasswordVissibleCubit>(context).passwordVissible2();
                                            })),
                                    obscureText: state.isPasswordVisible2 as bool,
                                    // to hide the text of this field
                                    validator: (value) {
                                      if (value!.length < 6) {
                                        return 'Password is less than 6';
                                      }
                                      if (password1 != _password) {
                                        return 'Password mismatch';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      password1 = value!;
                                    },
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                  );
                                },
                              ),
                              const SizedBox(height: 60),
                              //
                              Button(
                                onPressed: () {
                                  var key = formKey.currentState;
                                  if (key!.validate()) {
                                    key.save();
                                    print("object");
                                    BlocProvider.of<SignUpBloc>(context).add(
                                        SignupLoadingEvent(
                                            email: email,
                                            username: username,
                                            password: _password));
                                  }
                                },
                                text: 'signup',
                              ),
                              const SizedBox(height: 30),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("/");
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.blue[900],
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ));
  }
}
