import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heartbeats_app/shared/cubit/cubit.dart';
import 'package:heartbeats_app/shared/cubit/states.dart';
import 'package:path/path.dart';
import '../../constants.dart';

bool b1 = false;
BuildContext? dialogContext;

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
        var cubit = AppCubit.get(context);

        // var k=cubit.deleteFromDataBase(id: id)
        return Center(
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
              ConditionalBuilder(
                condition: AppCubit.get(context).signals.isNotEmpty,
                fallback: (context) => const Center(
                    child: Text(
                  'There is no history yet .',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
                builder: (context) => Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildHistoryItem(
                          AppCubit.get(context).signals[index], context),
                      separatorBuilder: (index, context) => const SizedBox(
                            height: 1,
                          ),
                      itemCount: AppCubit.get(context).signals.length),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}

Widget buildHistoryItem(
  Map history,
  context,
) =>
    Material(
      child: InkWell(
        onLongPress: () {
          print("Long Press");
          void delete(int id) {
            AppCubit.get(context).deleteFromDataBase(id: id);
            print('asdas');
          }

          showDialog(
              context: context,
              builder: (context) {
                dialogContext = context;
                return buildDialog(history['id'], delete);
              });

          // AppCubit.get(context).deleteFromDataBase(id: history['id']);
        },
        child: SizedBox(
          height: 110,
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),

            color: int.parse(history['signal']) > 80
                ? chartCardsColor
                : chartCardsColor2,

            // color: chartCardsColor,

            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Normal ECG',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Text(history['time']),
                      ]),
                  const Spacer(),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 8),
                      Text(
                        history['signal'],
                        style: TextStyle(
                          color: int.parse(history['signal']) > 80
                              ? Colors.blue
                              : secondColor,
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
          ),
        ),
      ),
    );

Widget buildDialog(int id, fun) {
  return Dialog(
    insetAnimationCurve: Curves.linearToEaseOut,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    child: Container(
      padding: EdgeInsets.all(20),
      height: 150,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Do you want to delete this data ?',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    fun(id);
                    Navigator.pop(dialogContext!);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('yes'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(dialogContext!);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('No'),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
