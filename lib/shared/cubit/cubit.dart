import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heartbeats_app/screens/filter_results.dart';
import 'package:sqflite/sqflite.dart';
import '../../screens/history/history_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/settings/profile_screen.dart';
import './states.dart';
import 'package:path/path.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  int signalValue = 0;

  List<Widget> screens = [
    HomeScreen(title: 'title'),
    const HistoryRecords(title: 'History'),
    const Profile(
      title: 'Setting',
    ), //title: 'Profile'
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

  Database? database;
  List<Map> signals = [];
  void createDatabase() {
    openDatabase('test.db', version: 1, onCreate: (database, version) {
      print("database created");
      database
          .execute(
              'CREATE TABLE history(id INTEGER PRIMARY KEY,signal TEXT,time TEXT)')
          .then((value) {
        print("table Created");
      }).catchError((error) {
        print('error when creating table ${error.toString()}');
      });
    }, onOpen: (database) {
      print("DataBase Opened");
      getData(database);
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  void getData(database) async {
    database.rawQuery('select * from history').then(
      (value) {
        signals = value;
        print(signals);
        emit(AppGetDataFromDatabaseState());
      },
    );
  }

  insertToDatabase({@required signal, @required time}) async {
    await database!.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO history (signal,time) VALUES ("$signal","$time")')
          .then((value) {
        print("$value inserted successfully");
        emit(AppInsertToDatabaseState());
        getData(database);
      }).catchError((error) {
        print("$error cant insert new record");
      });
      return Future<void>(() {});
    });
  }

  void deleteFromDataBase({required int id}) {
    database!.rawDelete('DELETE FROM task WHERE id = ?', [id]).then((value) {
      getData(database);
      emit(AppDeleteFromDatabaseState());
    });
  }
}
