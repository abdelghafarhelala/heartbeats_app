import 'package:flutter/material.dart';
import '../constants.dart';
import '../size_config.dart';
// import 'https://flutlab.io/root/app/lib/constants.dart';
// import 'https://flutlab.io/root/app/lib/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315,
      // width: double.infinity,
      height: getProportionateScreenHeight(53),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: KPrimaryColor,
        onPressed: press(),
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(17),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
