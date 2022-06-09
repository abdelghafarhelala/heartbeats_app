import 'package:flutter/material.dart';
import '../../../size_config.dart';
import '../../../constants.dart';
// import 'https://flutlab.io/root/app/lib/size_config.dart';
// import 'https://flutlab.io/root/app/lib/constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
    required this.content,
  }) : super(key: key);
  final String text, image, content;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: <Widget>[
          // Spacer(flex: 2),
          Spacer(),

          Image.asset(
            image,
            height: getProportionateScreenHeight(250),
            width: getProportionateScreenWidth(285),
          ),
          Container(
            margin: EdgeInsets.only(top: 37, bottom: 16),
            child: Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(15),
                )),
          ),
          // Spacer(flex: 2),
        ],
      );
    });
  }
}
