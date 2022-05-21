import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heartbeats_app/shared/cubit/cubit.dart';
import 'package:heartbeats_app/shared/cubit/states.dart';
import '../../constants.dart';

class HistoryRecords extends StatefulWidget {
  final title;

  const HistoryRecords({Key? key, required this.title}) : super(key: key);

  @override
  State<HistoryRecords> createState() => _HistoryRecordsState();
}

class _HistoryRecordsState extends State<HistoryRecords> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Center(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10.0),
              child: Column(children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 1000,
                  child: ListView.separated(
                      itemBuilder: (context, index) => buildHistoryItem(
                          AppCubit.get(context).signals[index]),
                      separatorBuilder: (index, context) => const SizedBox(
                            height: 1,
                          ),
                      itemCount: AppCubit.get(context).signals.length),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}

Widget buildHistoryItem(Map history) => Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      color: chartCardsColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              const Text(
                'Normal ECG',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(history['time']
                  // '10 MAR,2022',
                  ),
            ]),
            const Spacer(),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 8),
                Text(
                  // '95 ',
                  history['signal'],
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'bpm',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
