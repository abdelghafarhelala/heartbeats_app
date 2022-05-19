import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heartbeats_app/screens/filter_results.dart';
import '../../screens/history/history_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/settings/profile_screen.dart';
import './states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  int signalValue = 0;

  List<Widget> screens = [
    HomeScreen(title: 'title'),
    const HistoryRecords(title: 'History'),
    const FilterResults(), //title: 'Profile'
  ];

  List<String> titles = [
    'Home',
    'History',
    'Setting',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
}
