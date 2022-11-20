import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserTransactionInfo extends StatelessWidget {
  UserTransactionInfo({Key? key, required this.transactionInfo}) : super(key: key);
  final transactionInfo;

  String debit = 'Debit';
  String credit = 'Credit';

  @override
  Widget build(BuildContext context) {
    DateTime? time = transactionInfo.dateTime.toLocal();
    String formattedDate = DateFormat.yMMMMEEEEd().add_jm().format(time!);
    var transactionType = transactionInfo.credit == false ? debit : credit;
    String? dataAmount = transactionInfo.dataAmount.toString();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        foregroundColor: const Color(0xff12122a),
        shadowColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Row(
              children: [
                const Text('Transaction Id :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),),
                Expanded(child: Container()),
                Text(transactionInfo.transactionId),
              ],
            ),
            const Divider(),
            const SizedBox(height: 40,),
            Row(
              children: [
                const Text('Data Amount :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),),
                Expanded(child: Container()),
                Text('$dataAmount GB')
              ],
            ),
            const Divider(),
            const SizedBox(height: 40,),
            Row(
              children: [
                const Text('Transaction Type :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),),
                Expanded(child: Container()),
                Text(transactionType)
              ],
            ),



            Builder(builder: (context) {
              var toWallet = transactionInfo.toWallet;
              /// some operation here ...
              if(transactionInfo.toWallet == true) {
                return Column(
                  children: [
                    const Divider(),
                    const SizedBox(height: 40,),
                    Row(
                      children: [
                        const Text('To_wallet :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),),
                        Expanded(child: Container()),
                        Text('$toWallet')
                      ],
                    ),
                  ],
                );
              }
              else {
                return Container();
              }
            }),

            Builder(builder: (context) {

              /// some operation here ...
              if(transactionInfo.sentTo != null) {
                return Column(
                  children: [
                    const Divider(),
                    const SizedBox(height: 40,),
                    Row(
                      children: [
                        const Text('Sent_To :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),),
                        Expanded(child: Container()),
                        Text(transactionInfo.sentTo)
                      ],
                    ),
                  ],
                );
              }
              else {
                return Container();
              }
            }),

            Builder(builder: (context) {

              /// some operation here ...
              if(transactionInfo.receivedFrom == null) {
                return Container();
              }
              else {
                return Column(
                  children: [
                    const Divider(),
                    const SizedBox(height: 40,),
                    Row(
                      children: [
                        const Text('Received_From :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),),
                        Expanded(child: Container()),
                        Text(transactionInfo.receivedFrom)
                      ],
                    ),
                  ],
                );
              }
            }),
            const Divider(),
            const SizedBox(height: 40,),
            Row(
              children: [
                const Text('Date :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),),
                Expanded(child: Container()),
                Text(formattedDate.toString())
              ],
            ),



          ],
        ),
      ),
    );
  }
}
