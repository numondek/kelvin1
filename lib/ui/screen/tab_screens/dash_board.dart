import 'package:d8er1/data/model/user_transaction.dart';
import 'package:d8er1/logic/transactions/user_transaction_bloc.dart';
import 'package:d8er1/ui/componet/card.dart';
import 'package:d8er1/ui/screen/transaction_screens/user_transaction_info.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);
  late List<UserTransaction> _data = [];
  late List<Data> credit = [];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserTransactionBloc>(context).add(UserTransactionLoading());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(
                  color: Color(0xff3f4961),
                  width: 1,
                ),
              ),
              shadowColor: const Color(0xff252526),
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child:
                        BlocBuilder<UserTransactionBloc, UserTransactionState>(
                      builder: (context, state) {
                        if (state is UserTransactionLoaded) {
                          List<UserTransaction> userDetail = state.data;

                          return Container(
                              color: Colors.transparent,
                              child: SfCartesianChart(
                                  borderColor: Colors.blueAccent,
                                  primaryXAxis: CategoryAxis(
                                      visibleMaximum: 4,
                                      borderColor: Colors.blueAccent,
                                      borderWidth: 0,
                                      maximum: 12,
                                      isInversed: true,
                                      labelPlacement:
                                          LabelPlacement.betweenTicks,
                                      labelsExtent: 20,
                                      majorGridLines: const MajorGridLines(
                                          width: 0, color: Colors.white),
                                      majorTickLines: const MajorTickLines(
                                          width: 0, color: Colors.white),
                                      minorGridLines: const MinorGridLines(
                                          width: 0, color: Colors.white),
                                      minorTickLines: const MinorTickLines(
                                          width: 0, color: Colors.white),
                                      zoomPosition: 0.6),
                                  primaryYAxis: NumericAxis(
                                    borderColor: Colors.white,
                                    borderWidth: 0,
                                    majorGridLines: const MajorGridLines(
                                        width: 0, color: Colors.white),
                                    majorTickLines: const MajorTickLines(
                                        width: 0, color: Colors.white),
                                    minorGridLines: const MinorGridLines(
                                        width: 0, color: Colors.white),
                                    minorTickLines: const MinorTickLines(
                                        width: 0, color: Colors.white),
                                  ),
                                  zoomPanBehavior: ZoomPanBehavior(
                                    enablePanning: true,
                                  ),
                                  borderWidth: 0,
                                  plotAreaBorderWidth: 0,
                                  enableAxisAnimation: true,
                                  plotAreaBackgroundColor: Colors.blueAccent,
                                  // Chart title
                                  plotAreaBorderColor: Colors.blueAccent,
                                  // Enable legend
                                  legend: Legend(isVisible: false),
                                  // Enable tooltip
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  series: <
                                      ChartSeries<UserTransaction, String>>[
                                    ColumnSeries<UserTransaction, String>(
                                        dataSource: userDetail,
                                        xValueMapper:
                                            (UserTransaction sales, _) => sales
                                                .dateTime
                                                ?.toLocal()
                                                .toString(),
                                        yValueMapper:
                                            (UserTransaction sales, _) =>
                                                sales.dataAmount,
                                        pointColorMapper:
                                            (UserTransaction sale, _) {
                                          if (sale.credit == true) {
                                            return const Color(0xff12122a);
                                          } else {
                                            return const Color(0xff957796);
                                          }
                                        },
                                        color: const Color(0xff12122a),
                                        name: 'Data',
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25)),
                                        // gradient: const LinearGradient(
                                        //   begin: Alignment.topRight,
                                        //   end: Alignment.bottomLeft,
                                        //   colors: [
                                        //     Color(0xff12122a),
                                        //     Color(0xffb3d7ef),
                                        //   ],
                                        // ),
                                        onPointLongPress: (index) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserTransactionInfo(
                                                          transactionInfo:
                                                              userDetail[index
                                                                      .pointIndex
                                                                  as int])));
                                        },
                                        animationDelay: 300,
                                        spacing: 2,
                                        animationDuration: 3.5,
                                        trackColor: Colors.white,
                                        trackBorderWidth: 0,
                                        borderWidth: 0,
                                        initialSelectedDataIndexes: <int>[4],
                                        enableTooltip: true,

                                        // Enable data label
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                isVisible: true))
                                  ]));
                        }
                        return (SfCartesianChart(
                            borderColor: Colors.white,
                            primaryXAxis: CategoryAxis(
                                visibleMaximum: 3,
                                borderColor: Colors.white,
                                borderWidth: 0,
                                maximum: 12,
                                isInversed: true,
                                labelPlacement: LabelPlacement.betweenTicks,
                                labelsExtent: 20,
                                majorGridLines: const MajorGridLines(
                                    width: 0, color: Colors.white),
                                majorTickLines: const MajorTickLines(
                                    width: 0, color: Colors.white),
                                minorGridLines: const MinorGridLines(
                                    width: 0, color: Colors.white),
                                minorTickLines: const MinorTickLines(
                                    width: 0, color: Colors.white),
                                zoomPosition: 0.6),
                            primaryYAxis: NumericAxis(
                              borderColor: Colors.white,
                              borderWidth: 0,
                              majorGridLines: const MajorGridLines(
                                  width: 0, color: Colors.white),
                              majorTickLines: const MajorTickLines(
                                  width: 0, color: Colors.white),
                              minorGridLines: const MinorGridLines(
                                  width: 0, color: Colors.white),
                              minorTickLines: const MinorTickLines(
                                  width: 0, color: Colors.white),
                            ),
                            zoomPanBehavior: ZoomPanBehavior(
                              enablePanning: true,
                            ),
                            borderWidth: 0,
                            plotAreaBorderWidth: 0,
                            enableAxisAnimation: true,
                            plotAreaBackgroundColor: Colors.white,
                            // Chart title
                            plotAreaBorderColor: Colors.white,
                            // Enable legend
                            legend: Legend(isVisible: false),
                            // Enable tooltip
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: <ChartSeries<UserTransaction, String>>[
                              ColumnSeries<UserTransaction, String>(
                                  dataSource: _data,
                                  xValueMapper: (UserTransaction sales, _) =>
                                      sales.dateTime.toString(),
                                  yValueMapper: (UserTransaction sales, _) =>
                                      sales.dataAmount,
                                  color: const Color(0xff12122a),
                                  name: 'Data',
                                  gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xff3f4961),
                                      Color(0xffb3d7ef),
                                    ],
                                  ),
                                  animationDelay: 300,
                                  spacing: 2,
                                  animationDuration: 3.5,
                                  trackColor: Colors.white,
                                  trackBorderWidth: 0,
                                  borderWidth: 0,
                                  initialSelectedDataIndexes: <int>[4],
                                  enableTooltip: true,

                                  // Enable data label
                                  dataLabelSettings:
                                      const DataLabelSettings(isVisible: true))
                            ]));
                      },
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                side: BorderSide(
                  color: Color(0xff3f4961),
                  width: 1,
                ),
              ),
              shadowColor: const Color(0xff252526),
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocBuilder<UserTransactionBloc, UserTransactionState>(
                  builder: (context, state) {
                    if (state is UserTransactionLoaded) {
                      var tt = state.data.toList().firstWhere((element) => element.credit==true);
                      var td = state.data.toList().firstWhere((element) => element.credit==false);
                      print(tt.dataAmount);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          LastTransaction(
                            text1: 'Last Received',
                            text2: '${tt.dataAmount} GB',
                            icon: Icons.arrow_upward,
                            color: Colors.green,
                          ),
                          LastTransaction(
                            text1: 'Last Sent',
                            text2: '${td.dataAmount} GB',
                            icon: Icons.arrow_downward_outlined,
                            color: Colors.red,
                          ),
                        ],
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        LastTransaction(
                          text1: 'Last Received',
                          text2: '0 GB',
                          icon: Icons.arrow_upward,
                          color: Colors.green,
                        ),
                        LastTransaction(
                          text1: 'Last Sent',
                          text2: '0 GB',
                          icon: Icons.arrow_downward_outlined,
                          color: Colors.red,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Data {
  Data(this.credit, this.dataAmount );
  final bool? credit;
  final int? dataAmount;

}
