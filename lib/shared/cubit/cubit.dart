import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heartbeats_app/screens/filter_results.dart';
import 'package:heartbeats_app/screens/home/home.dart';
import 'package:heartbeats_app/screens/python_fliter/filter_signals_data_screen.dart';
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
    // HomeScreen(title: 'title'),
    Homedeal(title: 'title'),
    //const HistoryRecords(title: 'History'),
    const HistoryRecords(
      title: 'History',
    ),
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
    if (index == 1) {
      getData(database);
    }
    emit(AppChangeBottomNavBarState());
  }

  Database? database;
  List<Map> signals = [];
  List<Map> phones = [];
  void createDatabase() {
    openDatabase('test.db', version: 1, onCreate: (database, version) {
      print("database created");
      database
          .execute(
              'CREATE TABLE history(id INTEGER PRIMARY KEY,signal INTEGER,time TEXT)')
          .then((value) {
        print("table Created");
      }).catchError((error) {
        print('error when creating table ${error.toString()}');
      });
      database
          .execute(
              'CREATE TABLE phones(id INTEGER PRIMARY KEY,phone1 TEXT,phone2 TEXT)')
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
    database!.rawDelete('DELETE FROM history WHERE id = ?', [id]).then((value) {
      getData(database);
      print('deleted');
      emit(AppDeleteFromDatabaseState());
    });
  }

  Future<void> deleteDatabase(String path) {
    return databaseFactory.deleteDatabase(path).then((value) {
      print('deleted');
      emit(AppDeleteFromDatabaseState());
    });
  }

  String cc(num a, String k) {
    k = a.toString();
    emit(AppChangeValueState());

    return k;
  }

  void getDataFromPhones(database) async {
    database.rawQuery('select * from phones').then(
      (value) {
        phones = value;
        print(phones);
        emit(AppGetDataFromDatabaseState());
      },
    );
  }

  insertToDatabaseToPhones({@required phone1, @required phone2}) async {
    await database!.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO phones (phone1,phone2) VALUES ("$phone1","$phone2")')
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

  updateDatabaseToPhones(
      {@required phone1, @required phone2, @required int? id}) async {
    await database!.transaction((txn) {
      txn.rawUpdate(' UPDATE phones SET phone1 = ?, phone2 = ? WHERE id = ?',
          [phone1, phone2, id]).then((value) {
        print("$value update successfully");
        emit(AppUpdateDatabaseState());
        getData(database);
      }).catchError((error) {
        print("$error cant update  record");
      });
      return Future<void>(() {});
    });
  }
}
