import 'package:d8er1/data/model/user_transaction.dart';
import 'package:d8er1/logic/transactions/user_transaction_bloc.dart';
import 'package:d8er1/ui/screen/transaction_screens/user_transaction_info.dart';
import 'package:d8er1/ui/utills/input_deco.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionHistory extends StatelessWidget {
   TransactionHistory({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  DateTime? start, finish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: DateTimeFormField(
                            initialValue: DateTime(2022, 04, 22),
                            initialDate: DateTime(2022, 04, 22),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.event_note),
                              labelText: 'From',
                            ),
                            mode: DateTimeFieldPickerMode.date,
                            autovalidateMode: AutovalidateMode.always,
                            validator: (DateTime? e) => (e?.day ?? 0) == 1
                                ? 'Please not the first day'
                                : null,
                            onDateSelected: (DateTime value) {
                              start = value;
                              print(value);
                              // setState(() {
                              //   start = value;
                              // });
                            },
                            onSaved: (DateTime? value) {
                              start = value;
                              // setState(() {
                              //   start = value;
                              // });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DateTimeFormField(
                            initialValue: DateTime.now(),
                            initialDate: DateTime.now(),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.event_note),
                              labelText: 'To',
                            ),
                            mode: DateTimeFieldPickerMode.date,
                            autovalidateMode: AutovalidateMode.always,
                            validator: (DateTime? e) {
                              return (e?.day ?? 0) == 1
                                  ? 'Please not the first day'
                                  : null;
                            },
                            onDateSelected: (DateTime value) {
                              finish = value;
                              print(value);
                              // setState(() {
                              //   finish = value;
                              // });
                            },
                            onSaved: (DateTime? value) {
                              finish = value;
                              // setState(() {
                              //   finish = value;
                              // });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(580, 55),
                        primary: Colors.white,
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xff12122a),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<UserTransactionBloc>(context).add(UserTransactionLoading());
                      },

                      child: const Text(
                        'search',
                        style: TextStyle(
                          color: Color(0xff12122a),
                          fontSize: 17,
                        ),
                      ),
                      // this is the styling for the button
                    ),
                  ],
                ),
              ),
              BlocBuilder<UserTransactionBloc, UserTransactionState>(
                  builder: (context, state) {
                    if (state is UserTransactionLoadingState) {
                      return Container(
                          color: Colors.transparent,
                          child: Dialog(
                            // The background color
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 20),
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
                          itemCount: userDetail.length,
                          itemBuilder: (BuildContext content, int index) {
                            String? userT = userDetail[index].dataAmount.toString();
                            // print(userT);
                            // print(userDetail[index].credit);
                            var mobileData = (userDetail[index].credit  != true
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
                            DateTime? time = userDetail[index].dateTime ;
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
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserTransactionInfo(transactionInfo: userDetail[index])));
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Container();

                  }
              ),
            ],
          ),
        ));
  }
}
