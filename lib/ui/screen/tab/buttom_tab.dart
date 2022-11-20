import 'package:d8er1/logic/cubit/tabs_state/tab_state_cubit.dart';
import 'package:d8er1/logic/transactions/user_transaction_bloc.dart';
import 'package:d8er1/logic/user_info/user_info_bloc.dart';
import 'package:d8er1/ui/screen/tab_screens/dash_board.dart';
import 'package:d8er1/ui/screen/tab_screens/home.dart';
import 'package:d8er1/ui/screen/tab_screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:d8er1/ui/utills/dialog.dart';

class BottomTab extends StatelessWidget {
  final userInfo = UserInfoBloc();
  final userTransaction = UserTransactionBloc();

  BottomTab({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      BlocProvider.value(
        value: userTransaction,
        child: Home(),
      ),
      BlocProvider.value(
        value: userTransaction,
        child: DashBoard(),
      ),
      const Settings()
    ];
    List<String> titleString = ["Home", "Dashboard", "Settings"];

    return BlocProvider(
      create: (context) => TabStateCubit(),
      child: WillPopScope(
        onWillPop: () => PopDialog().onWillPop(context),
        child:  BlocBuilder<TabStateCubit, TabStateState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                foregroundColor: const Color(0xff12122a),
                shadowColor: Colors.white,
                title: Text(titleString[state.currentState as int]),
                centerTitle: true,
                // actions: <Widget>[
                //   IconButton(icon: const Icon(Icons.notifications), onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => const notify(),
                //     ));
                //   }),
                // ],
              ),
              bottomNavigationBar: BottomAppBar(
                elevation: 0.0,
                color: Colors.white,
                notchMargin: 12,
                child: SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: state.currentState as int == 0
                              ? const Icon(Icons.home)
                              : const Icon(Icons.home_outlined),
                          color: state.currentState as int == 0
                              ? const Color(0xff12122a)
                              : const Color(0xff3f4961),
                          onPressed: () {
                            BlocProvider.of<TabStateCubit>(context)
                                .firstState();
                          },
                          iconSize: 27,
                        ),
                        IconButton(
                          icon: state.currentState as int == 1
                              ? const Icon(Icons.person)
                              : const Icon(Icons.person_outline),
                          color: state.currentState as int == 1
                              ? const Color(0xff12122a)
                              : const Color(0xff3f4961),
                          onPressed: () {
                            BlocProvider.of<TabStateCubit>(context)
                                .secondState();
                          },
                          iconSize: 27,
                        ),
                        IconButton(
                          icon: state.currentState as int == 2
                              ? const Icon(Icons.add_circle)
                              : const Icon(Icons.add_circle_outline),
                          color: state.currentState as int == 2
                              ? const Color(0xff12122a)
                              : const Color(0xff3f4961),
                          onPressed: () {
                            BlocProvider.of<TabStateCubit>(context)
                                .thirdState();
                          },
                          iconSize: 27,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              body: widgets[state.currentState as int],
            );
          },
        ),
      ),
    );
  }
}
