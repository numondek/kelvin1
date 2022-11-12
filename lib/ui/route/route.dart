


import 'package:d8er1/logic/login_bloc.dart';
import 'package:d8er1/logic/user_info/user_info_bloc.dart';
import 'package:d8er1/ui/screen/create_profile.dart';
import 'package:d8er1/ui/screen/dashborad.dart';
import 'package:d8er1/ui/screen/home.dart';
import 'package:d8er1/ui/screen/login.dart';
import 'package:d8er1/ui/screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRoute {
  final loginbloc = LoginBloc();
  final userInfo = UserInfoBloc();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case"/":
        return MaterialPageRoute(builder: (context) =>
            MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: loginbloc,
                ),
                BlocProvider.value(
                  value: userInfo,
                ),
              ],
              child: Login(),
            ));
      case"/Signup":
        return MaterialPageRoute(builder: (_) => SignUp());
      case"/Home":
        return MaterialPageRoute(builder: (_) => const Home());
      case"/Profile":
        return MaterialPageRoute(builder: (_) => CreateProfile());
      case"/Dashboard":
        return MaterialPageRoute(builder: (context) =>
            MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: loginbloc,
                ),
              ],
              child: const Dashborad(),
            ));
      default:
        return null;
    }
  }
}