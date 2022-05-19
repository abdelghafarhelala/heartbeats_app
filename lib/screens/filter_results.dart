import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class FilterResults extends StatefulWidget {
  const FilterResults({Key? key}) : super(key: key);

  @override
  State<FilterResults> createState() => _FilterResultsState();
}

class _FilterResultsState extends State<FilterResults> {
  List<List<dynamic>> data = [];
  loadAsset() async {
    final myData = await rootBundle.loadString("assets/files/Walk.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    data = csvTable;
    print(data);
  }
  // final input = new File('Walk.csv').openRead();
  // final fields = await input.transform(utf8.decoder).transform(new CsvToListConverter()).toList();

  void lpf(List x) {
    List y = x;
    x.asMap().forEach((n, value) {
      if (n < 12) {
        //continue;
      }
      //2*y.iloc[n-1,1] - y.iloc[n-2,1] + x.iloc[n,1] - 2*x.iloc[n-6,1] + x.iloc[n-12,1]
      // int v= 2* y.firstWhere((element) => n-1) -
      // y.insert(n, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(data.toString()),
    );
  }
}
