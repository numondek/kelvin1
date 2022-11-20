import 'package:d8er1/data/model/user_transaction.dart';
import 'package:d8er1/logic/transactions/user_transaction_bloc.dart';
import 'package:d8er1/logic/user_info/user_info_bloc.dart';
import 'package:d8er1/ui/componet/icon_button.dart';
import 'package:d8er1/ui/screen/transaction_screens/buy_data.dart';
import 'package:d8er1/ui/screen/transaction_screens/send_data.dart';
import 'package:d8er1/ui/screen/transaction_screens/share_data.dart';
import 'package:d8er1/ui/screen/transaction_screens/transaction_history.dart';
import 'package:d8er1/ui/screen/transaction_screens/user_transaction_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => UserInfoBloc()..add(UserInfoLoadingEvent()),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                fit: StackFit.passthrough,
                children: [
                  BlocBuilder<UserInfoBloc, UserInfoState>(
                    builder: (context, state) {
                      if (state is UserInfoLoaded) {
                        return Container(
                            height: 200,
                            color: const Color(0xff023e7d),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Hey ${state.userDetail.lastname.toString()}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 20, bottom: 10),
                                  child: Center(
                                    child: Text(
                                      '${state.userDetail.dataamount.toString()} GB',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 55),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ));
                      }
                      return Container(
                          height: 200,
                          color: const Color(0xff023e7d),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Hey user',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 20, left: 20, bottom: 10),
                                child: Center(
                                  child: Text(
                                    '0 GB',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 55),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ));
                    },
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 180,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButtons(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>  ShareData()));
                            },
                            icon: Icons.share,
                            name: 'ShareData',
                          ),
                          IconButtons(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SendData()));
                            },
                            icon: Icons.send,
                            name: 'SendData',
                          ),
                          IconButtons(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const BuyData()));
                            },
                            icon: Icons.store,
                            name: 'BuyData',
                          ),
                          IconButtons(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BlocProvider.value(
                                        value: UserTransactionBloc(),
                                        child: TransactionHistory(),
                                      )));
                            },
                            icon: Icons.history,
                            name: 'History',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: BlocBuilder<UserTransactionBloc, UserTransactionState>(
                      builder: (context, state) {
                    if (state is UserTransactionLoadingState) {
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
                    if (state is UserTransactionLoaded) {
                      List<UserTransaction> userDetail = state.data;
                      return Expanded(
                        child: ListView.builder(
                          itemCount:
                              userDetail.length > 9 ? 9 : userDetail.length,
                          itemBuilder: (BuildContext content, int index) {
                            String? userT =
                                userDetail[index].dataAmount.toString();
                            // print(userT);
                            // print(userDetail[index].credit);
                            var mobileData = (userDetail[index].credit != true
                                ? const Icon(
                                    Icons.mobiledata_off,
                                    color: Colors.red,
                                    size: 40,
                                  )
                                : const Icon(
                                    Icons.mobiledata_off_rounded,
                                    color: Colors.green,
                                    size: 40,
                                  ));
                            DateTime? time = userDetail[index].dateTime;
                            String formattedDate =
                                DateFormat.yMMMMd().add_jm().format(time!);
                            // if (kDebugMode) {
                            //   print(mobileData);
                            // }
                            if (userDetail.isEmpty) {
                              return const Center(
                                child: Text(
                                  'No Transactions',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color(0xff3f4961),
                                  ),
                                ),
                              );
                            }
                            return Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              color: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                side: BorderSide(
                                  color: Color(0xff3f4961),
                                  width: 1,
                                ),
                              ),
                              shadowColor: const Color(0xff252526),
                              child: ListTile(
                                leading: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.white,
                                    child: mobileData),
                                // title: Column(children: []),
                                subtitle: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '$userT GB',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Color(0xff3f4961),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          formattedDate.toString(),
                                          style: const TextStyle(
                                            color: Color(0xff3f4961),
                                            fontSize: 8,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => UserTransactionInfo(
                                          transactionInfo: userDetail[index])));
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  }),
                ),
              ),
            ],
          ),
        ));
  }
}
