import 'package:adobe_xd/pinned.dart';
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
import '../connect_serial/SelectBondedDevicePage.dart';
import '../connect_serial/syncfusion_chart.dart';
import '../connect_buetooth/bluetooth_dialog.dart';
import './home_chart_screen.dart';
import '../../utilitys/theme.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        var cubit = AppCubit.get(context);
        return Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(size: 90.0, start: 30.0),
              Pin(size: 21.0, start: 92.0),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 80.0, start: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: const Text(
                      'welcome',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 17,
                        color: Color(0xff1b2428),
                        height: 1.2941176470588236,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                  // Pinned.fromPins(
                  //   Pin(size: 80.0, middle: 0.4783),
                  //   Pin(start: 0.0, end: 0.0),
                  //   child: const Text(
                  //     'UserName',
                  //     style: TextStyle(
                  //       fontFamily: 'Lato',
                  //       fontSize: 17,
                  //       color: Color(0xff1b2428),
                  //       fontWeight: FontWeight.w700,
                  //       height: 1.2941176470588236,
                  //     ),
                  //     textHeightBehavior:
                  //         TextHeightBehavior(applyHeightToFirstAscent: false),
                  //     softWrap: false,
                  //   ),
                  // ),
                  Pinned.fromPins(
                    Pin(size: 18.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(1.5, 1.5, 2.7, 2.0),
                          child: SizedBox.expand(
                              child: SvgPicture.string(
                            svg_g3na,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(size: 24.7, end: 30.0),
              Pin(size: 24.7, start: 92.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const QuestionsScreen(title: 'Question'),
                      ));
                },
                child: Stack(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        SizedBox.expand(
                            child: SvgPicture.string(
                          svg_gccwwt,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 120.0, start: 30.0),
              Pin(size: 16.0, start: 118.0),
              child: Text(
                date.toString(),
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 13,
                  color: Color(0xff1b2428),
                  height: 1.6923076923076923,
                ),
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(start: 30.0, end: 30.0),
              Pin(size: 120.0, middle: 0.263),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: int.parse(AppCubit.get(context)
                              .cc(dataNum, signalStreamValue)) >
                          80
                      ? chartCardsColor
                      : chartCardsColor2,
                ),
                child: Stack(
                  children: [
                    // SizedBox.expand(
                    //     child: SvgPicture.string(
                    //   svg_zq0nm,
                    //   allowDrawingOutsideViewBox: true,
                    //   fit: BoxFit.fill,
                    // )),
                    Pinned.fromPins(
                      Pin(size: 52.0, start: 36.0),
                      Pin(size: 44.0, middle: 0.6842),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 21.0, start: 0.0),
                            Pin(start: 0.0, end: 0.0),
                            child: Text(
                              '#',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 36,
                                color: int.parse(AppCubit.get(context)
                                            .cc(dataNum, signalStreamValue)) >
                                        80
                                    ? chartCardsColor
                                    : chartCardsColor2,
                                fontWeight: FontWeight.w900,
                                height: 0.6111111111111112,
                              ),
                              textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 26.0, end: 0.0),
                            Pin(size: 16.0, end: 6.0),
                            child: Text(
                              AppCubit.get(context)
                                  .cc(dataNum, signalStreamValue),
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 13,
                                color: Color(0xff484848),
                                fontWeight: FontWeight.w700,
                                height: 1.6923076923076923,
                              ),
                              textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 68.0, start: 36.0),
                      Pin(size: 18.0, middle: 0.2353),
                      child: const Text(
                        'Heart rate',
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
                    ),
                    const Align(
                      alignment: Alignment(0.253, 0.538),
                      child: SizedBox(
                        width: 42.0,
                        height: 16.0,
                        child: Text(
                          'Status :',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 13,
                            color: Color(0xff1b2428),
                            height: 1.6923076923076923,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 56.0, end: 42.0),
                      Pin(size: 16.0, middle: 0.7692),
                      child: Text(
                        int.parse(AppCubit.get(context)
                                    .cc(dataNum, signalStreamValue)) >
                                80
                            ? 'Normal'
                            : 'Abnormal',
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 13,
                          color: Color(0xff1b2428),
                          fontWeight: FontWeight.w700,
                          height: 1.6923076923076923,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 113.4, start: 165.6),
                      Pin(size: 40.0, middle: 0.3),
                      child: Stack(
                        children: <Widget>[
                          SizedBox.expand(
                              child: SvgPicture.string(
                            svg_t4j01,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment(0.0, -0.170),
              child: SizedBox(
                width: 110.0,
                height: 18.0,
                child: Text(
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
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.7),
              child: Container(
                width: 400,
                height: 380,
                child: chartPage,
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.972),
              child: SizedBox(
                width: 196.0,
                height: 49.0,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 315,
                      // width: double.infinity,
                      height: 50.0,
                      child: Stack(
                        children: <Widget>[
                          Container(
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
                                      FlutterBluetoothSerial.instance.state
                                          .then((state) {
                                        setState(() {
                                          if (state.isEnabled == true) {
                                            //if bluetooth opened go to celect device
                                            future() async {
                                              final BluetoothDevice?
                                                  selectedDevice =
                                                  await Navigator.of(context)
                                                      .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return const SelectBondedDevicePage(
                                                        checkAvailability:
                                                            false);
                                                  },
                                                ),
                                              );

                                              if (selectedDevice != null) {
                                                print('Connect -> selected ' +
                                                    selectedDevice.address);
                                                _startChat(
                                                    context, selectedDevice);
                                              } else {
                                                print(
                                                    'Connect -> no device selected');
                                              }
                                            }

                                            future().then((_) {
                                              //Navigator.of(context).pop();
                                              setState(() {});
                                            });
                                            if (kDebugMode) {
                                              print(state.isEnabled);
                                              print(
                                                  'open selected bluetooth device page');
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
                                            print(
                                                'open dialog if bluetooth not opened');
                                          }
                                        });
                                      });
                                    } else {
                                      // AppCubit.get(context)
                                      //     .deleteFromDataBase(id: 11);
                                      AppCubit.get(context).insertToDatabase(
                                          signal: int.parse(signalStreamValue),
                                          time: chartData[chartData.length - 1]
                                              .time
                                              .toString());
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
