import 'package:adobe_xd/pinned.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heartbeats_app/constants.dart';

import 'package:heartbeats_app/screens/home/showChartInHome.dart';
import 'package:heartbeats_app/screens/main_screen.dart';
import 'package:heartbeats_app/screens/questions_screen/questionScreen.dart';
import 'package:heartbeats_app/shared/cubit/cubit.dart';
import 'package:heartbeats_app/shared/cubit/states.dart';
import 'package:intl/intl.dart';
import '../connect_serial/SelectBondedDevicePage.dart';
import '../connect_serial/syncfusion_chart.dart';
import '../connect_buetooth/bluetooth_dialog.dart';

import '../../utilitys/theme.dart';

class Homedeal extends StatefulWidget {
  final String title;
  const Homedeal({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  State<Homedeal> createState() => _HomedealScreenState();
}

class _HomedealScreenState extends State<Homedeal> {
  String titleButton = "Start Monitoring";
  Color colorButton = chartgradientStartColor;
  Widget chartPage = ShowChart();
  String signalStreamValue = dataNum.toString();
  DateTime date = DateTime.now();
  void _startChat(BuildContext context, BluetoothDevice server) {
    setState(() {
      chartPage = SyncfusionChart(server: server);
      titleButton = "Stop Monitoring";
      colorButton = secondColor;
    });
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return SyncfusionChart(server: server);
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: ((context, state) {}),
      builder: (context, state) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        // print('height' + screenHeight.toString());
        // print(screenWidth);
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(date);
        var cubit = AppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight / 30,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'welcome',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 17,
                                color: Color(0xff1b2428),
                                height: 1.2941176470588236,
                                fontWeight: FontWeight.w500),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                              child: SvgPicture.string(
                            svg_g3na,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          )),
                        ],
                      ),
                      Text(
                        formatted.toString(),
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 13,
                          color: Color(0xff1b2428),
                          height: 1.6923076923076923,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const QuestionsScreen(title: 'Question'),
                          ));
                    },
                    child: SizedBox(
                        child: SvgPicture.string(
                      svg_gccwwt,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight / 45,
              ),
              Container(
                height: screenHeight / 7.1,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: int.parse(AppCubit.get(context)
                                  .cc(dataNum, signalStreamValue)) >=
                              60 &&
                          int.parse(AppCubit.get(context)
                                  .cc(dataNum, signalStreamValue)) <=
                              100
                      ? chartCardsColor
                      : chartCardsColor2,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Heart rate',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: Color(0xff5c5d5e),
                              fontWeight: FontWeight.w700,
                              height: 1.4666666666666666,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                '#',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 33,
                                  color: int.parse(AppCubit.get(context).cc(
                                                  dataNum,
                                                  signalStreamValue)) >=
                                              60 &&
                                          int.parse(AppCubit.get(context).cc(
                                                  dataNum,
                                                  signalStreamValue)) <=
                                              100
                                      ? chartgradientStartColor
                                      : secondColor,
                                  fontWeight: FontWeight.w900,
                                  height: 0.6111111111111112,
                                ),
                                textHeightBehavior: const TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                AppCubit.get(context)
                                    .cc(dataNum, signalStreamValue),
                                style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 28,
                                  color: Color(0xff484848),
                                  fontWeight: FontWeight.w700,
                                  height: 1.6923076923076923,
                                ),
                                textHeightBehavior: const TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'bpm',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        SizedBox(
                            child: SvgPicture.string(
                          svg_t4j01,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                          color: int.parse(AppCubit.get(context)
                                          .cc(dataNum, signalStreamValue)) >=
                                      60 &&
                                  int.parse(AppCubit.get(context)
                                          .cc(dataNum, signalStreamValue)) <=
                                      100
                              ? chartgradientStartColor
                              : secondColor,
                        )),
                        Spacer(),
                        Row(
                          children: [
                            const Text(
                              'Status :',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 15,
                                color: Color(0xff1b2428),
                                height: 1.6923076923076923,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                            Text(
                              int.parse(AppCubit.get(context)
                                              .cc(dataNum, signalStreamValue)) >
                                          60 &&
                                      int.parse(AppCubit.get(context)
                                              .cc(dataNum, signalStreamValue)) <
                                          100
                                  ? 'Normal'
                                  : 'Abnormal',
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 15,
                                color: Color(0xff1b2428),
                                fontWeight: FontWeight.w700,
                                height: 1.6923076923076923,
                              ),
                              textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight / 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Real-Time ECG',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 15,
                      color: Color(0xff5c5d5e),
                      fontWeight: FontWeight.w700,
                      height: 1.4666666666666666,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ],
              ),
              // SizedBox(
              //   height: 40,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    // height: screenHeight <= 400
                    //     ? screenHeight / 3.42
                    //     : screenHeight / 2.8,
                    height: screenHeight / 2.63,
                    child: chartPage,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight / 35,
              ),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                  color: colorButton,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      child: Text(
                        titleButton,
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (titleButton == "Start Monitoring") {
                          FlutterBluetoothSerial.instance.state.then((state) {
                            setState(() {
                              if (state.isEnabled == true) {
                                //if bluetooth opened go to celect device
                                future() async {
                                  final BluetoothDevice? selectedDevice =
                                      await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const SelectBondedDevicePage(
                                            checkAvailability: false);
                                      },
                                    ),
                                  );

                                  if (selectedDevice != null) {
                                    print('Connect -> selected ' +
                                        selectedDevice.address);
                                    _startChat(context, selectedDevice);
                                  } else {
                                    print('Connect -> no device selected');
                                  }
                                }

                                future().then((_) {
                                  //Navigator.of(context).pop();
                                  setState(() {});
                                });
                                if (kDebugMode) {
                                  print(state.isEnabled);
                                  print('open selected bluetooth device page');
                                }
                              } else {
                                //open dialog if bluetooth not opened
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        ChechkBluetoothDialog());

                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //       builder: (BuildContext context) {
                                //     return const ChechkBluetoothDialog();
                                //   }),
                                // );
                                print('open dialog if bluetooth not opened');
                              }
                            });
                          });
                        } else {
                          // AppCubit.get(context)
                          //     .deleteFromDataBase(id: 11);
                          AppCubit.get(context).insertToDatabase(
                              signal: int.parse(AppCubit.get(context)
                                  .cc(dataNum, signalStreamValue)),
                              time: chartData[chartData.length - 1]
                                  .time
                                  .toString());
                          //play sound if state is abnormal
                          if (int.parse(signalStreamValue) < 60 ||
                              int.parse(signalStreamValue) > 100) {
                            final player = AudioCache();
                            player.play('audio/tiit.mp3');
                          }
                          // print(chartData[chartData.length - 1]
                          //     .signal
                          //     .runtimeType);
                          // print(signalData);
                          // print(timeData);

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) {
                              cubit.currentIndex = 0;
                              return MainScreen(title: 'Home');
                            }),
                            (Route<dynamic> route) => false,
                          );
                        }
                      }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
