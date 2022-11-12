import 'package:d8er1/logic/login_bloc.dart';
import 'package:d8er1/ui/componet/buttonWidget.dart';
import 'package:d8er1/ui/utills/input_deco.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isPasswordVisible = true;
    bool isPasswordVisible1 = true;
    String username = '';
    String password = '';
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          foregroundColor: const Color(0xff12122a),
          shadowColor: Colors.white,
          centerTitle: true,
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
            listener: (newcontext, state) async {
          // String token = '';
          if (state is LoginLoaded) {
            Navigator.of(context).pushNamed("/Dashboard");
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message!)));
          }
        }, builder: (context, state) {
          if (state is LoginLoading) {
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
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),

                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onTap: () {
                        _controller.text = '';
                      },
                      decoration: buildInputDecoration(hintText: 'username'),
                      // this acts as validating the values of the form
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill this field';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        username = value!;
                        print(value);
                      },

                      // controller: _controller,
                      keyboardType: TextInputType.text,
                    ),

                    const SizedBox(height: 40),

                    TextFormField(
                      decoration: buildInputDecoration(
                          hintText: 'password',
                          icon:
                              const Icon(Icons.lock, color: Color(0xff12122a)),
                          suffixIcon: IconButton(
                              icon: isPasswordVisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () =>
                                  isPasswordVisible1 = !isPasswordVisible1)),
                      // obscureText: isPasswordVisible, // to hide the text of this field
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Password is less than 6';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value!;
                      },

                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 60),

                    Button(
                      key: key,
                      onPressed: () {
                        var key = formKey.currentState;
                        if (key!.validate()) {
                          key.save();
                          print("object");
                          BlocProvider.of<LoginBloc>(context)
                              .add(LoginLoginEvent(username, password));
                        }
                      },
                      text: 'Login',
                    ),

                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/Signup");
                          },
                          child: Text(
                            "New User?",
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 10),
                    // InkWell(
                    //   onTap: () => setState(() {
                    //     _launched = _launchInWebViewOrVC(toLaunch);
                    //   }),
                    //   child: Text(
                    //     "Forgot Password?",
                    //     style: TextStyle(
                    //       color: Colors.blue[900],
                    //       fontSize: 15,
                    //
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
