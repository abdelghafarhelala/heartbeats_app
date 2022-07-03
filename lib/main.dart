import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heartbeats_app/screens/home/home.dart';
import 'package:heartbeats_app/screens/main_screen.dart';
import 'package:heartbeats_app/screens/on_boarding/on_boarding_screen.dart';
import 'package:heartbeats_app/shared/cubit/cubit.dart';
import 'package:heartbeats_app/shared/shared_preferences/cache_Helper.dart';
import 'package:path/path.dart';
import './routs.dart';
import './screens/splash/splash_screen.dart';
import './utilitys/theme.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.sharedPreferences.getBool('onBoarding');
  Widget? widget;
  if (onBoarding == true) {
    widget = SplashScreen();
  } else {
    widget = OnBoardingScreen();
  }

  runApp(
    MyApp(
      startWidget: widget,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.startWidget}) : super(key: key);
  final Widget startWidget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget examp = SplashScreenView(
      navigateRoute: startWidget,
      duration: 4000,
      imageSize: 130,
      imageSrc: "assets/images/splash.png",
      text: "Heart Beats",
      textType: TextType.NormalText,
      textStyle: TextStyle(fontSize: 30.0, color: Colors.white),
      backgroundColor: Color.fromRGBO(39, 149, 255, 1),
    );
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: myThemeData,

        // home: MainScreen(title: 'title'),
        home: examp,
      ),
    );
  }
}
