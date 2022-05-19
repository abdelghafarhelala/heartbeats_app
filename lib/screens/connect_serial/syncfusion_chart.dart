import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:heartbeats_app/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SyncfusionChart extends StatefulWidget {
  final BluetoothDevice server;
  const SyncfusionChart({
    Key? key,
    required this.server,
  }) : super(key: key);

  @override
  State<SyncfusionChart> createState() => _SyncfusionChartState();
}

class _SyncfusionChartState extends State<SyncfusionChart> {
  BluetoothConnection? connection;
  //String _messageBuffer = '';

  late List<LiveData> chartData;
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
      child: Scaffold(
        body: Align(
          alignment: const Alignment(0.0, 0.7),
          child: Container(
            width: 400,
            height: 335,
            child: SfCartesianChart(
              series: <LineSeries<LiveData, double>>[
                LineSeries<LiveData, double>(
                  onRendererCreated: (ChartSeriesController controller) {
                    _chartSeriesController = controller;
                  },
                  dataSource: chartData,
                  color: chartgradientStartColor,
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
      ),
    );
  }

  double time = 0;
  void updateDataSource(Uint8List data) {
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
    String dataString = String.fromCharCodes(buffer);
    num dataNum = num.parse(dataString);

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
