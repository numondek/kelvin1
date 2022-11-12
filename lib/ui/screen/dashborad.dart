import 'package:d8er1/logic/login_bloc.dart';
import 'package:d8er1/logic/user_info/user_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Dashborad extends StatelessWidget {
  const Dashborad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          foregroundColor: const Color(0xff12122a),
          shadowColor: Colors.white,
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => UserInfoBloc()..add(UserInfoLoadingEvent()),
          child: BlocBuilder<UserInfoBloc, UserInfoState>(
            builder: (context, state) {

              if (state is UserInfoLoaded) {
                return SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/4.png"),
                          opacity: 1.0,
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Center(
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundColor: const Color(0xffa9a9ad),
                                  // foregroundColor: Color(0xffa9a9ad),
                                  child: Icon(
                                    Icons.person,
                                    size: 90,
                                    color: Color(0xff12122a),
                                  ),
                                  // backgroundImage: NetworkHandler().getImage(profileModel.username),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  "${state.userDetail.firstname.toString()} ${state.userDetail.lastname.toString()}",
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  maxFontSize: 40,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
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
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => const Edit(),
                              // ));
                            },

                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            // this is the styling for the button
                          ),
                          // Divider(
                          //   thickness: 0.8,
                          //   height: 2,
                          //   color: Color(0xff12122a),
                          // ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(children: [
                            const Icon(
                              Icons.phone,
                              size: 20,
                              color: Color(0xff12122a),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              state.userDetail.number.toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Color(0xff12122a)),
                            ),
                            Expanded(child: Container()),
                            const Text(
                              "Mobile",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff12122a),
                              ),
                            )
                          ]),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(children: [
                            const Icon(
                              Icons.mail,
                              size: 20,
                              color: Color(0xff12122a),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.5,
                              child: FittedBox(
                                child: AutoSizeText(
                                  state.userDetail.firstname.toString(),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff12122a),
                                  ),
                                  maxLines: 1,
                                  maxFontSize: 17,
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            const Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff12122a),
                              ),
                            )
                          ]),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(children: [
                            const Icon(
                              Icons.map_outlined,
                              size: 20,
                              color: Color(0xff12122a),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              state.userDetail.location.toString(),
                              style: const TextStyle(
                                fontSize: 17,
                                color: Color(0xff12122a),
                              ),
                            ),
                            Expanded(child: Container()),
                            const Text(
                              "Location",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff12122a),
                              ),
                            )
                          ]),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(children: [
                            const Icon(
                              Icons.male,
                              size: 20,
                              color: Color(0xff12122a),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              state.userDetail.gender.toString(),
                              style: const TextStyle(
                                  fontSize: 17, color: Color(0xff12122a)),
                            ),
                            Expanded(child: Container()),
                            const Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff12122a),
                              ),
                            )
                          ]),
                          const SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        )

    );
  }
}