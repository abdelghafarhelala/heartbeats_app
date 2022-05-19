import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import './connect_buetooth/bluetooth_dialog.dart';
import './home/home_chart_screen.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
import '../utilitys/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the Main page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                setState(() {
                  cubit.changeIndex(index);
                });
                print(cubit.currentIndex);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.grey[300]!,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: cubit.titles[0],
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.post_add_outlined),
                  label: cubit.titles[1],
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: cubit.titles[2],
                ),
              ],
            ),
            backgroundColor: const Color(0xffffffff),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
