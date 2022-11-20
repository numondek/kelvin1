import 'package:d8er1/logic/cubit/password_vissible_cubit.dart';
import 'package:d8er1/logic/login_bloc.dart';
import 'package:d8er1/logic/user_info/user_info_bloc.dart';
import 'package:d8er1/ui/screen/auth_screens/login.dart';
import 'package:d8er1/ui/screen/auth_screens/sign_up.dart';
import 'package:d8er1/ui/screen/settings_screens/create_profile.dart';
import 'package:d8er1/ui/screen/tab/buttom_tab.dart';
import 'package:d8er1/ui/screen/tab_screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRoute {
  final loginbloc = LoginBloc();
  final userInfo = UserInfoBloc();
  final passVissible = PasswordVissibleCubit();


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
                BlocProvider.value(
                  value: passVissible,
                ),
              ],
              child: Login(),
            ));
      case"/Signup":
        return MaterialPageRoute(builder: (_) =>
            MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: passVissible,
                ),
              ],
              child: SignUp(),
            ));
      // case"/Home":
      //   return MaterialPageRoute(builder: (_) =>
      //       BlocProvider.value(
      //         value: userTransaction,
      //         child: Home(),
      //       ));
      case"/Profile":
        return MaterialPageRoute(builder: (_) => CreateProfile());
      case"/Tab":
        return MaterialPageRoute(builder: (_) => BottomTab());
      // case"/DashBoard":
      //   return MaterialPageRoute(builder: (_) =>
      //       BlocProvider.value(
      //         value: userTransaction,
      //         child: DashBoard(),
      //       ));
      case"/Settings":
        return MaterialPageRoute(builder: (context) =>
            MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: loginbloc,
                ),
              ],
              child: const Settings(),
            ));
      default:
        return null;
    }
  }
}