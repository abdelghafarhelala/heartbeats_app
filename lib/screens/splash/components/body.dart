import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../screens/main_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import './splash_content.dart';
import '../../../components/default_button.dart';
// import 'https://flutlab.io/root/app/lib/screens/splash/components/splash_content.dart';
// import 'https://flutlab.io/root/app/lib/components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Electrodes Placement", "image": "assets/images/electrodes.png"},
    {"text": "Bluetooth Pairing", "image": "assets/images/blutooth.png"},
    {"text": "Start Monitoring", "image": "assets/images/start.png"},
    // {
    //   "text": "Lorem ipsum dolor sit amet consectetur adipiscing elit urna velit amet tempor egestas fringilla bibendum vel nisl sed dolormsne iste drakon.",
    //   "image": "assets/images/electrodes.png"
    // },
    // {
    //   "text": "Lorem ipsum dolor sit amet consectetur adipiscing elit urna velit amet tempor egestas",
    //   "image": "assets/images/blutooth.png"
    // },
    // {
    //   "text": "Lorem ipsum dolor sit amet consectetur adipiscing",
    //   "image": "assets/images/start.png"
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"]!,
                  text: splashData[index]["text"]!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    SizedBox(
                      width: 315,
                      // width: double.infinity,
                      height: getProportionateScreenHeight(53),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                              color: Color(0xFF09BAA6),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(17),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return MainScreen(
                                        title: 'chart',
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: KAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: currentPage == index ? 30 : 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? KPrimaryColor
            : Color(0xFF09BAA6).withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
