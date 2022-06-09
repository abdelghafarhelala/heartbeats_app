import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../screens/main_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import './splash_content.dart';
import '../../../components/default_button.dart';

// import 'https://flutlab.io/root/app/lib/screens/splash/components/splash_content.dart';
// import 'https://flutlab.io/root/app/lib/components/default_button.dart';
bool isLast = false;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  var boardController = PageController();
  List<Map<String, String>> splashData = [
    {
      "text": "Electrodes Placement",
      "image": "assets/images/electrodes.png",
      "content":
          "Connect the three colored electrodes of the attached measuring device with the application to their correct position on the body as shown in the image above"
    },
    {
      "text": "Bluetooth Pairing",
      "image": "assets/images/blutooth.png",
      "content":
          "Then turn on your phone's bluetooth so you can pair with the bluetooth of measuring device which you will find with the name hc-05 tostart measuring"
    },
    {
      "text": "Start Monitoring",
      "image": "assets/images/start.png",
      "content":
          "Now finally after pairing with Bluetooth the application will start displaying the live ECG which will enable you to monitor the heart condition throughout the day"
    },
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          if (isLast == false)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: KPrimaryColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return MainScreen(
                          title: 'chart',
                        );
                      }),
                    );
                  }),
            )
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: boardController,
                  onPageChanged: (int value) {
                    if (value == splashData.length - 1) {
                      setState(() {
                        isLast = true;
                        currentPage = value;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                        currentPage = value;
                      });
                    }
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"]!,
                    text: splashData[index]["text"]!,
                    content: splashData[index]["content"]!,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length, (index) {
                          if (isLast == false)
                            return buildDot(index: index);
                          else
                            return buildDot2(index: index);
                        }),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 315,
                        // width: double.infinity,
                        height: getProportionateScreenHeight(53),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (isLast == false)
                                    Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: KPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: TextButton(
                                        child: Text(
                                          "Next",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(17),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (isLast) {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                                isLast = false;
                                                return MainScreen(
                                                  title: 'chart',
                                                );
                                              }),
                                            );
                                          } else {
                                            boardController.nextPage(
                                              duration: const Duration(
                                                milliseconds: 740,
                                              ),
                                              curve:
                                                  Curves.fastLinearToSlowEaseIn,
                                            );
                                          }
                                          // Navigator.of(context).push(
                                          //   MaterialPageRoute(
                                          //       builder: (BuildContext context) {
                                          //     return MainScreen(
                                          //       title: 'chart',
                                          //     );
                                          //   }),
                                          // );
                                        },
                                      ),
                                    ),
                                  if (isLast == true)
                                    Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: chartgradientStartColor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: TextButton(
                                        child: Text(
                                          "Get started",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(17),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (isLast) {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                                isLast = false;
                                                return MainScreen(
                                                  title: 'chart',
                                                );
                                              }),
                                            );
                                          } else {
                                            boardController.nextPage(
                                              duration: const Duration(
                                                milliseconds: 740,
                                              ),
                                              curve:
                                                  Curves.fastLinearToSlowEaseIn,
                                            );
                                          }
                                          // Navigator.of(context).push(
                                          //   MaterialPageRoute(
                                          //       builder: (BuildContext context) {
                                          //     return MainScreen(
                                          //       title: 'chart',
                                          //     );
                                          //   }),
                                          // );
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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

  AnimatedContainer buildDot2({required int index}) {
    return AnimatedContainer(
      duration: KAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: currentPage == index ? 30 : 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? chartgradientStartColor
            : Color(0xFF2469BD).withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
