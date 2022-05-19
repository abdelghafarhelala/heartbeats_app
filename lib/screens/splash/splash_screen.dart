import 'package:flutter/material.dart';
import '../../size_config.dart';
// import 'https://flutlab.io/root/app/lib/size_config.dart';
import './components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";

  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // you have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
