import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:heartbeats_app/constants.dart';
import 'package:heartbeats_app/screens/home/home_screen.dart';
import 'package:heartbeats_app/screens/python_fliter/filter_signals_data_screen.dart';
import 'package:heartbeats_app/shared/cubit/cubit.dart';
import 'package:heartbeats_app/shared/cubit/states.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

num dataNum = 0;

List bag = [];
late List<LiveData> chartData;

class SyncfusionChart extends StatefulWidget {
  final BluetoothDevice server;
  SyncfusionChart({
    Key? key,
    required this.server,
  }) : super(key: key);

  @override
  State<SyncfusionChart> createState() => _SyncfusionChartState();
}

class _SyncfusionChartState extends State<SyncfusionChart> {
  BluetoothConnection? connection;
  //String _messageBuffer = '';
  final FilterSignalsData ft = new FilterSignalsData();

  late ChartSeriesController _chartSeriesController;
  bool isConnecting = true;
  bool get isConnected => (connection?.isConnected ?? false);

  bool isDisconnecting = false;
  @override
  void initState() {
    chartData = getChartData();
    super.initState();
    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });
      connection!.input!.listen(updateDataSource).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
          print('Disconnecting locally!');
        } else {
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Align(
              alignment: const Alignment(0.0, 0.7),
              child: Container(
                width: 400,
                height: 335,
                child: SfCartesianChart(
                  palette: [Colors.red],
                  series: <LineSeries<LiveData, double>>[
                    LineSeries<LiveData, double>(
                      onRendererCreated: (ChartSeriesController controller) {
                        _chartSeriesController = controller;
                      },
                      dataSource: chartData,
                      color:
                          int.parse(AppCubit.get(context).cc(dataNum, '')) > 80
                              ? chartgradientStartColor
                              : secondColor,
                      xValueMapper: (LiveData sales, _) => sales.time,
                      yValueMapper: (LiveData sales, _) => sales.signal,
                    )
                  ],
                  // primaryXAxis: NumericAxis(
                  //   majorGridLines: const MajorGridLines(width: 0),
                  //   edgeLabelPlacement: EdgeLabelPlacement.shift,
                  //   interval: 3,
                  //   title: AxisTitle(text: 'Time (seconds)'),
                  // ),
                  primaryYAxis: NumericAxis(
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    title: AxisTitle(text: 'ECG'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  double time = 0;
  void updateDataSource(List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });

    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;
    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }
    // Create liveData if there is new line character
    for (int i = 0; i < buffer.length; i++) {
      bag.add(buffer[i]);
    }
    //-------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------
    FilterSignalsDataState().run(bag);
    String dataString = String.fromCharCodes(ff!.cast<int>());
    dataNum = num.parse(dataString);

    if (kDebugMode) {
      print('==========>');
      print(buffer);
      print('........>');
      print(dataNum);
      print('==========<');
    }

    int index = buffer.indexOf(13);
    if (~index != 0) {
      time = time + 0.005;

      chartData.add(LiveData(time, dataNum));
      setState(() {
        chartData.add(
          LiveData(time, dataNum),
        );
        chartData.removeAt(0);
        _chartSeriesController.updateDataSource(
            addedDataIndex: chartData.length - 1, removedDataIndex: 0);
      });
    } else {}
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0.0, 0),
    ];
  }
}

class LiveData {
  LiveData(this.time, this.signal);
  final double time;
  final num signal;
}
