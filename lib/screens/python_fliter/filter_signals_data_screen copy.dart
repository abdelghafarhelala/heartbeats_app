// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';

List? ff;
List? time = [];

class FilterSignalsData2 extends StatefulWidget {
  const FilterSignalsData2({Key? key}) : super(key: key);

  @override
  State<FilterSignalsData2> createState() => _FilterSignalsData2State();
}

class _FilterSignalsData2State extends State<FilterSignalsData2> {
  List<List<dynamic>> _data = [];
  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/files/walk.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
    // print('-----------pure data-------');
    // print(_data);
    // print('-------end pure data----------');
  }

  //#low-pass filter
  //#function
  List<dynamic> lpf(List<dynamic> x) {
    List<dynamic> y = x;
    int a = 1;
    x.asMap().forEach((n, value) {
      if (n < 13) {
        //continue;
      } else {
        num value1 = 2 * y[n - 1][1]; //2 *
        num value2 = y[n - 2][1];
        num value3 = x[n][1];
        num value4 = 2 * x[n - 6][1]; // 2 *
        num value5 = x[n - 12][1];
        if (a < 40) {
          y[n][1] = value1 - value2 + value3 - value4 + value5;
          // print('---------y[n]-----');
          // print(y[n].toString());
        }
      }
      a++;
    });
    return y;
  }

// high-pass filter
// function
  List<dynamic> hpf(List<dynamic> x) {
    List<dynamic> y = x;
    int a = 1;
    x.asMap().forEach((n, value) {
      if (n < 33) {
        //continue;
      } else {
        //y.iloc[n,1] = y.iloc[n-1,1] - x.iloc[n,1]/32 + x.iloc[n-16,1] - x.iloc[n-17,1] + x.iloc[n-32,1]/32
        num value1 = y[n - 1][1];
        num value2 = x[n][1] / 32;
        num value3 = x[n - 16][1];
        num value4 = x[n - 17][1];
        num value5 = x[n - 32][1];
        if (a < 60) {
          y[n][1] = value1 - value2 + value3 - value4 + value5 / 32;
          // print('---------y[n]-----');
          // print(y[n].toString());
        }
      }
      a++;
    });
    return y;
  }

  //defivative of signal
  //function
  List<dynamic> deriv(List<dynamic> x) {
    List<dynamic> y = x;
    int a = 1;
    x.asMap().forEach((n, value) {
      if (n < 5) {
        //continue;
      } else {
        //y.iloc[n, 1] = (2*x.iloc[n,1] + x.iloc[n-1,1] - x.iloc[n-3,1] - 2*x.iloc[n-4,1])/4
        num value1 = 2 * x[n][1];
        num value2 = x[n - 1][1];
        num value3 = x[n - 3][1];
        num value4 = 2 * x[n - 4][1];
        if (a < 60) {
          y[n][1] = (value1 + value2 - value3 - value4) / 4;
          // print('---------y[n]----- from deriv');
          // print(y[n].toString());
        }
      }
      a++;
    });
    return y;
  }

  //squarring the signal
  List<dynamic> squaring(List<dynamic> x) {
    List<dynamic> y = x;
    x.asMap().forEach((n, value) {
      //y.iloc[n,1] = x.iloc[n,1]**2
      var value1 = x[n][1];
      y[n][1] = value1 * 2 * 2;
      // print('---------y[n]-----');
      // print(y[n].toString());
    });
    return y;
  }

  //integral of the signal for a moving window of ws size.
  List<dynamic> win_sum(List<dynamic> x, dynamic ws) {
    List<dynamic> y = x;
    int l = (ws / 2).toInt();
    x.asMap().forEach((n, value) {
      num tmp_sum = 0;
      if (n > 300 - l) {
        //break;
      } else if (n < l) {
        //continue
      } else {
        // for (dynamic j in Range(n - l, n + l + 1)) {}
        int j = 0;
        while (j >= (n - 1) && j <= (n + l + 1)) {
          tmp_sum += x[j][1];
          j++;
        }
        // y.iloc[n,1] = tmp_sum/(l+1)
        y[n][1] = tmp_sum / (l + 1);
      }

      //y.iloc[n,1] = x.iloc[n,1]**2
      var value1 = x[n][1];
      y[n][1] = value1 * 2 * 2;
      // print('---------y[n]-----');
      // print(y[n].toString());
    });
    return y;
  }

  void detection(List<dynamic> x) {
    List<dynamic> y = x;
  }

  List appe = [];

  List findPeaks(List a, {double? threshold}) {
    for (int i = 0; i < a.length; i++) {
      appe.add(a[i][1]);
      time!.add(a[i][0]);
    }
    var N = appe.length - 2;
    var ix = [];
    var ax = [];

    if (threshold != null) {
      for (var i = 1; i <= N; i++) {
        if (appe[i - 1] <= appe[i] &&
            appe[i] >= appe[i + 1] &&
            appe[i] >= threshold) {
          ix.add(i.toDouble());
          if (appe[i] == 0) {
          } else
            ax.add(appe[i]);
        }
      }
    } else {
      for (var i = 1; i <= N; i++) {
        if (appe[i - 1] <= appe[i] && appe[i] >= appe[i + 1]) {
          ix.add(i.toDouble());
          if (appe[i] == 0) {
          } else {
            ax.add(appe[i]);
          }
        }
      }
    }
    return ax;
  }

  int index = 0;
  var fs = 200;
  var RR_list = [];
  var RR_interval;
  var ms_dist;
  var mss_dist;

  List last(List peaklists) {
    while (index < ((peaklists.length) - 1)) {
      RR_interval = (peaklists[index + 1] - peaklists[index]);
      if (RR_interval > 0) {
        ms_dist = ((RR_interval / fs) * 1000.0);
        mss_dist = 60000 / ms_dist;
        RR_list.add(mss_dist);
      }

      index += 1;
    }
    return RR_list;
  }

  void run() {
    var f1 = lpf(_data);
    var f2 = hpf(f1);
    var f3 = deriv(f2);
    var f4 = squaring(f3);
    var window_size = 22;
    var f5 = win_sum(f4, window_size);
    var f6 = findPeaks(f5);
    print('----------------first-----------------');
    print(f6);
    print('----------------first-----------------');
    ff = last(f6);
    // print('---------y[n]-----');
    print(ff.toString());
    // var f5 = win_sum(f4, window_size);
    // var heart = ff[0][1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
            child: const Text(
              'titleButton',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
              alignment: Alignment.center,
            ),
            onPressed: () {
              _loadCSV();
              print('-----------lpf-------');
              // win_sum(squaring(deriv(hpf(lpf(_data)))), 22);
              run();
              print('-------lpf end----------');
              if (kDebugMode) {
                print('rrrrrrrrr');
              }
            }),
      ),
    );
  }
}
