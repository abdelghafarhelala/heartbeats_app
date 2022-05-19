import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConnectBluetooth extends StatelessWidget {
  ConnectBluetooth({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            color: const Color(0xffffffff),
          ),
          SizedBox.expand(
              child: SvgPicture.string(
            _svg_i4826i,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          )),
          Align(
            alignment: Alignment(0.0, 0.672),
            child: SizedBox(
              width: 196.0,
              height: 49.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 49.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff3098fe),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 104.0, middle: 0.5),
                    Pin(size: 17.0, end: 16.0),
                    child: Text(
                      'Start Monitoring',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 14,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(),
          Align(
            alignment: Alignment(0.0, -0.118),
            child: SizedBox(
              width: 99.0,
              height: 18.0,
              child: Text(
                'Real-Time ECG',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 15,
                  color: const Color(0xff5c5d5e),
                  fontWeight: FontWeight.w700,
                  height: 1.4666666666666666,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 24.7, end: 30.0),
            Pin(size: 24.7, start: 92.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    SizedBox.expand(
                        child: SvgPicture.string(
                      _svg_gccwwt,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    )),
                  ],
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 114.0, start: 30.0),
            Pin(size: 16.0, start: 118.0),
            child: Text(
              'Today Mar 10, 2021',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 13,
                color: const Color(0xff1b2428),
                height: 1.6923076923076923,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 30.0, end: 30.0),
            Pin(size: 18.0, start: 13.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 38.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '10:41',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 15,
                      color: const Color(0xff27251f),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 15.0, end: 28.1),
                  Pin(start: 3.5, end: 3.5),
                  child: SvgPicture.string(
                    _svg_javaa,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 17.0, middle: 0.8353),
                  Pin(start: 3.5, end: 3.5),
                  child: SvgPicture.string(
                    _svg_uluo7,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 21.0,
                    height: 10.0,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 1.0,
                            height: 4.0,
                            child: SvgPicture.string(
                              _svg_s7anxt,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 15.0, start: 1.9),
                          Pin(start: 1.9, end: 1.9),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff181d23),
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.5),
                            border: Border.all(
                                width: 1.0, color: const Color(0x66181d23)),
                          ),
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 2.2, 0.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 30.0, end: 30.0),
            Pin(size: 120.0, middle: 0.263),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_zq0nm,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
                Pinned.fromPins(
                  Pin(size: 52.0, start: 36.0),
                  Pin(size: 44.0, middle: 0.6842),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 21.0, start: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: Text(
                          '#',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 36,
                            color: const Color(0xff3098fe),
                            fontWeight: FontWeight.w900,
                            height: 0.6111111111111112,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 26.0, end: 0.0),
                        Pin(size: 16.0, end: 6.0),
                        child: Text(
                          'bpm',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 13,
                            color: const Color(0xff484848),
                            fontWeight: FontWeight.w700,
                            height: 1.6923076923076923,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 68.0, start: 36.0),
                  Pin(size: 18.0, middle: 0.2353),
                  child: Text(
                    'Heart rate',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 15,
                      color: const Color(0xff5c5d5e),
                      fontWeight: FontWeight.w700,
                      height: 1.4666666666666666,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(0.253, 0.538),
                  child: SizedBox(
                    width: 42.0,
                    height: 16.0,
                    child: Text(
                      'Status :',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 13,
                        color: const Color(0xff1b2428),
                        height: 1.6923076923076923,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 56.0, end: 42.0),
                  Pin(size: 16.0, middle: 0.7692),
                  child: Text(
                    'Unknown',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 13,
                      color: const Color(0xff1b2428),
                      fontWeight: FontWeight.w700,
                      height: 1.6923076923076923,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 113.4, start: 165.6),
                  Pin(size: 40.0, middle: 0.3),
                  child: Stack(
                    children: <Widget>[
                      SizedBox.expand(
                          child: SvgPicture.string(
                        _svg_t4j01,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 74.0, end: 0.0),
            child: Container(
              color: const Color(0xfff8f8f8),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 257.5, middle: 0.4957),
            Pin(size: 57.0, end: 17.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 35.0, start: 0.5),
                  Pin(size: 40.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Container(),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 16.0, end: 0.0),
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 13,
                            color: const Color(0xff3098fe),
                            fontWeight: FontWeight.w700,
                          ),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(-0.054, 1.0),
                  child: SizedBox(
                    width: 43.0,
                    height: 40.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 16.0, end: 0.0),
                          child: Text(
                            'History',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 13,
                              color: const Color(0xff9e9e9e),
                              fontWeight: FontWeight.w700,
                            ),
                            softWrap: false,
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 46.0,
                    height: 40.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 16.0, end: 0.0),
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 13,
                              color: const Color(0xff9e9e9e),
                              fontWeight: FontWeight.w700,
                            ),
                            softWrap: false,
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 36.0,
                    height: 2.0,
                    color: const Color(0xff3098fe),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 126.0, start: 30.0),
            Pin(size: 21.0, start: 92.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 17.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    'Hi',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 17,
                      color: const Color(0xff1b2428),
                      height: 1.2941176470588236,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 80.0, middle: 0.4783),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    'UserName',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 17,
                      color: const Color(0xff1b2428),
                      fontWeight: FontWeight.w700,
                      height: 1.2941176470588236,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 18.0, end: 0.0),
                  Pin(start: 2.0, end: 1.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(1.5, 1.5, 2.7, 2.0),
                        child: SizedBox.expand(
                            child: SvgPicture.string(
                          _svg_g3na,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0x66000000),
          ),
          Pinned.fromPins(
            Pin(start: 30.0, end: 30.0),
            Pin(size: 426.0, middle: 0.5),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 17.0, end: 17.0),
                      Pin(size: 85.0, middle: 0.4985),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              width: 194.0,
                              height: 21.0,
                              child: Text(
                                'Bluetooth not connected!',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 17,
                                  color: const Color(0xff1b2428),
                                  fontWeight: FontWeight.w800,
                                ),
                                softWrap: false,
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 52.0, end: 0.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet consectetur adipiscing elit urna velit amet tempor egestas fringilla bibendum vel nisl.',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 13,
                                color: const Color(0xff1b2428),
                                height: 1.3846153846153846,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.0, 0.503),
                      child: SizedBox(
                        width: 193.0,
                        height: 44.0,
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 44.0, end: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffff3366),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 118.0, middle: 0.5),
                              Pin(size: 17.0, end: 13.5),
                              child: Text(
                                'Connect Bluetooth',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 101.0, middle: 0.5),
                      Pin(size: 101.0, start: 45.0),
                      child: Stack(
                        children: <Widget>[
                          SizedBox.expand(
                              child: SvgPicture.string(
                            _svg_ls6vgs,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          )),
                          Center(
                            child: SizedBox(
                              width: 41.0,
                              height: 41.0,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 1.6, vertical: 0.1),
                                    child: SizedBox.expand(
                                        child: SvgPicture.string(
                                      _svg_qk1yd,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  Container(
                                    color: const Color(0xffffffff),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 107.5, middle: 0.5),
                      Pin(size: 18.0, end: 45.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 89.0, end: 0.0),
                            Pin(start: 0.0, end: 0.0),
                            child: Text(
                              'Review Steps',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 15,
                                color: const Color(0xff1b2428),
                                fontWeight: FontWeight.w700,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 10.5, end: 97.0),
                            Pin(size: 9.1, middle: 0.5609),
                            child: Transform.rotate(
                              angle: 3.1416,
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(start: 0.0, end: 0.0),
                                    Pin(size: 1.0, middle: 0.5709),
                                    child: SvgPicture.string(
                                      _svg_binfc6,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      width: 4.0,
                                      height: 4.0,
                                      child: SvgPicture.string(
                                        _svg_qm7j48,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      width: 4.0,
                                      height: 4.0,
                                      child: SvgPicture.string(
                                        _svg_yae6qy,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Pinned.fromPins(
                  Pin(size: 12.0, end: 25.0),
                  Pin(size: 12.0, start: 25.0),
                  child: Stack(
                    children: <Widget>[
                      SizedBox.expand(
                          child: SvgPicture.string(
                        _svg_xgsis,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_i4826i =
    '<svg viewBox="0.0 0.0 375.0 812.0" ><path  d="M 0 0 L 375 0 L 375 812 L 0 812 L 0 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gccwwt =
    '<svg viewBox="0.0 0.0 24.7 24.7" ><path transform="translate(-2.0, -2.0)" d="M 14.35065460205078 2 C 21.17167282104492 2 26.70130729675293 7.529572486877441 26.70130729675293 14.35065460205078 C 26.70130729675293 21.17167282104492 21.17167282104492 26.70130729675293 14.35065460205078 26.70130729675293 C 12.32465267181396 26.70130729675293 10.36776542663574 26.21209907531738 8.614738464355469 25.29123115539551 L 3.315814018249512 26.67080116271973 C 2.754748344421387 26.8170337677002 2.18143105506897 26.48060035705566 2.035298109054565 25.91951179504395 C 1.99010705947876 25.74610900878906 1.990094900131226 25.56393623352051 2.035261154174805 25.39040946960449 L 3.414026737213135 20.09395408630371 C 2.490568161010742 18.33917427062988 2 16.37961959838867 2 14.35065460205078 C 2 7.529572486877441 7.529572486877441 2 14.35065460205078 2 Z M 14.35065460205078 18.67338180541992 C 13.66852760314941 18.67338180541992 13.1155891418457 19.22632026672363 13.1155891418457 19.908447265625 C 13.1155891418457 20.59057235717773 13.66852760314941 21.14351463317871 14.35065460205078 21.14351463317871 C 15.03278064727783 21.14351463317871 15.58571910858154 20.59057235717773 15.58571910858154 19.908447265625 C 15.58571910858154 19.22632026672363 15.03278064727783 18.67338180541992 14.35065460205078 18.67338180541992 Z M 14.35065460205078 7.866560459136963 C 12.47483730316162 7.866560459136963 10.95422458648682 9.387198448181152 10.95422458648682 11.26298999786377 C 10.95422458648682 11.77456760406494 11.36894702911377 12.18928909301758 11.88052272796631 12.18928909301758 C 12.34947681427002 12.18928909301758 12.73704051971436 11.84081554412842 12.79842472076416 11.3886833190918 L 12.81485080718994 11.10513782501221 C 12.89389419555664 10.32665061950684 13.55132007598877 9.719159126281738 14.35065460205078 9.719159126281738 C 15.20334339141846 9.719159126281738 15.89448547363281 10.41035079956055 15.89448547363281 11.26298999786377 C 15.89448547363281 11.92844390869141 15.72775268554688 12.25758838653564 15.09799098968506 12.90834522247314 L 14.72253227233887 13.29022789001465 C 13.79178714752197 14.25925922393799 13.42435550689697 14.95484828948975 13.42435550689697 16.2032527923584 C 13.42435550689697 16.71481704711914 13.83909034729004 17.12955093383789 14.35065460205078 17.12955093383789 C 14.86221885681152 17.12955093383789 15.27695274353027 16.71481704711914 15.27695274353027 16.2032527923584 C 15.27695274353027 15.53779888153076 15.44368743896484 15.20865535736084 16.07344818115234 14.55789756774902 L 16.44890594482422 14.17601585388184 C 17.37965202331543 13.20698356628418 17.74708366394043 12.51139545440674 17.74708366394043 11.26298999786377 C 17.74708366394043 9.387198448181152 16.22647094726562 7.866560459136963 14.35065460205078 7.866560459136963 Z" fill="#09baa6" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_javaa =
    '<svg viewBox="301.9 16.0 15.0 11.0" ><path transform="translate(238.43, 10.5)" d="M 70.99468231201172 7.359062671661377 C 73.41940307617188 7.359062671661377 75.62919616699219 8.232532501220703 77.32356262207031 9.664806365966797 L 78.5 8.394688606262207 C 76.49324798583984 6.691150665283203 73.87236022949219 5.500000476837158 70.99468231201172 5.500000476837158 C 68.12138366699219 5.500000476837158 65.50424194335938 6.687534332275391 63.50000381469727 8.385646820068359 L 64.67391967773438 9.657572746276855 C 66.36704254150391 8.229518890380859 68.57309722900391 7.359062671661377 70.99468231201172 7.359062671661377 L 70.99468231201172 7.359062671661377 Z M 70.99468231201172 11.02534580230713 C 72.44789886474609 11.02534580230713 73.77552795410156 11.54135036468506 74.79950714111328 12.3913106918335 L 76.04404449462891 11.04704761505127 C 74.68955993652344 9.910150527954102 72.92772674560547 9.167489051818848 70.99468231201172 9.167489051818848 C 69.06540679931641 9.167489051818848 67.30481719970703 9.908341407775879 65.95158386230469 11.04162216186523 L 67.19423675537109 12.38769435882568 C 68.21760559082031 11.53954315185547 69.54335784912109 11.02534580230713 70.99468231201172 11.02534580230713 L 70.99468231201172 11.02534580230713 Z M 73.55435180664062 13.73557662963867 C 72.86148834228516 13.17315483093262 71.96932220458984 12.78373908996582 70.99406433105469 12.78373908996582 C 70.02067565917969 12.78373908996582 69.1297607421875 13.17255210876465 68.4368896484375 13.7325611114502 L 70.99406433105469 16.50126266479492 L 73.55435180664062 13.73557662963867 L 73.55435180664062 13.73557662963867 Z" fill="#181d23" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s7anxt =
    '<svg viewBox="20.1 2.9 1.3 3.5" ><path transform="translate(-2.91, -0.63)" d="M 23.00000190734863 3.5 C 23.74099731445312 3.702278852462769 24.28852462768555 4.415698528289795 24.28852462768555 5.264749050140381 C 24.28852462768555 6.113801002502441 23.74099731445312 6.827220439910889 23.00000190734863 7.02949857711792 L 23.00000190734863 3.5 Z" fill="#181d23" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uluo7 =
    '<svg viewBox="278.9 16.0 17.0 11.0" ><path transform="translate(278.93, 16.0)" d="M 14.06896591186523 0.5759863257408142 C 14.06896591186523 0.2578778266906738 14.33945560455322 0 14.66210269927979 0 L 16.4068603515625 0 C 16.73444366455078 0 17 0.2504468262195587 17 0.5759863257408142 L 17 10.42527675628662 C 17 10.74338531494141 16.72950744628906 11.00126266479492 16.4068603515625 11.00126266479492 L 14.66210269927979 11.00126266479492 C 14.33452129364014 11.00126266479492 14.06896591186523 10.75081539154053 14.06896591186523 10.42527675628662 L 14.06896591186523 0.5759863257408142 Z M 9.37930965423584 3.478046417236328 C 9.37930965423584 3.156076908111572 9.649800300598145 2.895069360733032 9.972448348999023 2.895069360733032 L 11.71720695495605 2.895069360733032 C 12.04478740692139 2.895069360733032 12.31034469604492 3.164776802062988 12.31034469604492 3.478046417236328 L 12.31034469604492 10.41828536987305 C 12.31034469604492 10.74025440216064 12.0398530960083 11.00126266479492 11.71720695495605 11.00126266479492 L 9.972448348999023 11.00126266479492 C 9.644866943359375 11.00126266479492 9.37930965423584 10.73155498504639 9.37930965423584 10.41828536987305 L 9.37930965423584 3.478046417236328 Z M 4.68965482711792 5.787473201751709 C 4.68965482711792 5.469164848327637 4.960146427154541 5.211124420166016 5.282793521881104 5.211124420166016 L 7.027551174163818 5.211124420166016 C 7.355132102966309 5.211124420166016 7.620689392089844 5.459919452667236 7.620689392089844 5.787473201751709 L 7.620689392089844 10.42491436004639 C 7.620689392089844 10.74322319030762 7.350198745727539 11.00126266479492 7.027551174163818 11.00126266479492 L 5.282793521881104 11.00126266479492 C 4.955212593078613 11.00126266479492 4.68965482711792 10.75246715545654 4.68965482711792 10.42491436004639 L 4.68965482711792 5.787473201751709 Z M 0 8.10085391998291 C 0 7.784022331237793 0.270490974187851 7.527179718017578 0.5931385159492493 7.527179718017578 L 2.337895631790161 7.527179718017578 C 2.665477514266968 7.527179718017578 2.931034564971924 7.777027606964111 2.931034564971924 8.10085391998291 L 2.931034564971924 10.42758846282959 C 2.931034564971924 10.74442005157471 2.66054368019104 11.00126266479492 2.337895631790161 11.00126266479492 L 0.5931385159492493 11.00126266479492 C 0.2655571699142456 11.00126266479492 0 10.75141525268555 0 10.42758846282959 L 0 8.10085391998291 Z" fill="#181d23" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_zq0nm =
    '<svg viewBox="30.0 174.0 315.0 120.0" ><path transform="translate(30.0, 174.0)" d="M 20 0 L 295 0 C 306.0456848144531 0 315 8.954304695129395 315 20 L 315 100 C 315 111.0456924438477 306.0456848144531 120 295 120 L 20 120 C 8.954304695129395 120 0 111.0456924438477 0 100 L 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 Z" fill="#e2f1ff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_t4j01 =
    '<svg viewBox="447.2 561.8 113.4 40.0" ><path transform="translate(-517.0, -5.97)" d="M 964.2468872070312 599.0695190429688 C 964.2468872070312 599.0695190429688 970.6047973632812 601.7960205078125 976.5615844726562 602.1854858398438 C 982.5182495117188 602.5748901367188 983.2161254882812 592.8230590820312 988.1681518554688 591.9143676757812 C 993.1203002929688 591.0055541992188 992.6378784179688 600.8872680664062 1001.537170410156 600.8872680664062 C 1010.436584472656 600.8872680664062 1007.866149902344 567.7844848632812 1017.538024902344 567.8095092773438 C 1027.209594726562 567.8345947265625 1027.48681640625 612.6005859375 1034.692016601562 607.3870239257812 C 1041.897094726562 602.1737060546875 1039.558227539062 600.6033935546875 1047.772094726562 600.8872680664062 C 1055.986328125 601.1710815429688 1055.642822265625 594.75439453125 1060.630737304688 593.6514282226562 C 1063.677612304688 592.977783203125 1067.787109375 594.3720703125 1071.794799804688 596.28515625 C 1073.952514648438 597.3142700195312 1075.820190429688 598.5609130859375 1077.619140625 599.6184692382812" fill="none" stroke="#3098fe" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_g3na =
    '<svg viewBox="1.5 1.5 13.9 14.6" ><path transform="translate(1.46, 1.46)" d="M 4.484890937805176 9.383334159851074 C 3.489843606948853 8.5057373046875 2.115453004837036 7.314452648162842 0.3894394040107727 5.775192737579346 C 0.08671627938747406 5.489698886871338 0.06759707629680634 5.01463508605957 0.3463985919952393 4.705735683441162 C 0.6268854737281799 4.395105838775635 1.101986050605774 4.359769821166992 1.425339341163635 4.625490188598633 C 2.998885631561279 5.686923027038574 4.241235733032227 6.56597900390625 5.169897556304932 7.227641105651855 C 5.501822948455811 7.465460300445557 5.722134590148926 7.426795959472656 5.826454162597656 7.300591468811035 C 5.930773735046387 7.174386978149414 5.884814739227295 6.999305725097656 5.602495193481445 6.65278959274292 C 4.814627647399902 5.678168296813965 3.734957695007324 4.386941909790039 2.40725564956665 2.748469352722168 C 2.142238140106201 2.430695533752441 2.184676885604858 1.958319664001465 2.502091646194458 1.692872285842896 C 2.827318668365479 1.420727491378784 3.306105613708496 1.440308690071106 3.608023881912231 1.738101840019226 C 5.268867492675781 3.297788381576538 6.570794582366943 4.533572196960449 7.51380443572998 5.445456027984619 C 7.836976528167725 5.759144306182861 8.000385284423828 5.804373264312744 8.141910552978516 5.75039005279541 C 8.283434867858887 5.696406841278076 8.370245933532715 5.531538009643555 8.214860916137695 5.252866268157959 C 7.659705638885498 4.265114307403564 6.899559020996094 2.941058874130249 5.981838703155518 1.250061750411987 C 5.732350826263428 0.9145479798316956 5.7915358543396 0.4420316219329834 6.116067409515381 0.1784159392118454 C 6.443890571594238 -0.0849388912320137 6.919414520263672 -0.05056332424283028 7.20595121383667 0.2572031915187836 L 11.43709278106689 5.851790904998779 C 11.57788848876953 6.037815570831299 11.65594577789307 6.097634792327881 11.78069114685059 6.070643901824951 C 11.90543556213379 6.043652057647705 11.9171085357666 5.962677001953125 11.94555950164795 5.738718509674072 C 12.03820705413818 5.009211540222168 12.22423076629639 3.376574993133545 12.22423076629639 3.376574993133545 C 12.30491924285889 2.955576181411743 12.68397617340088 2.65874719619751 13.11203956604004 2.681354999542236 C 13.53081893920898 2.703056335449219 13.85952854156494 3.048425912857056 13.86051654815674 3.46776294708252 L 13.86051559448242 10.29157066345215 C 13.78863716125488 11.85901927947998 12.89287853240967 13.27147483825684 11.5056676864624 14.00475978851318 C 10.05770874023438 14.84301853179932 8.256670951843262 14.77346324920654 6.877673625946045 13.82602977752686 L 0.326701819896698 9.837087631225586 C -0.01367226056754589 9.593134880065918 -0.1020357757806778 9.12464714050293 0.1260873228311539 8.773467063903809 C 0.3540477752685547 8.424232482910156 0.8180443644523621 8.3189697265625 1.174389004707336 8.535646438598633 C 2.533460378646851 9.163752555847168 3.59124493598938 9.65471076965332 4.425071239471436 10.04937267303467 C 4.660701751708984 10.16098785400391 4.835783958435059 10.09168529510498 4.891955375671387 9.957454681396484 C 4.948126792907715 9.823225975036621 4.835783958435059 9.692645072937012 4.484890937805176 9.383334159851074 Z" fill="#ffa458" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qk1yd =
    '<svg viewBox="105.7 182.7 38.3 41.3" ><path transform="translate(96.52, 178.49)" d="M 37.33012008666992 32.17750549316406 L 27.5341682434082 24.83053016662598 L 29.75464630126953 23.16519165039062 C 30.76906585693359 22.40436553955078 30.97463989257812 20.96524047851562 30.21381378173828 19.95082473754883 C 29.4529857635498 18.93640327453613 28.01386260986328 18.73082733154297 26.99944496154785 19.49165725708008 L 26.00350570678711 20.23863983154297 L 26.00350570678711 11.05489540100098 L 26.9993839263916 11.80189800262451 C 28.01380348205566 12.56272602081299 29.45292472839355 12.35714817047119 30.21375465393066 11.34272956848145 C 30.97458076477051 10.32831001281738 30.76900291442871 8.889187812805176 29.75458335876465 8.128361701965332 L 25.08513069152832 4.62633228302002 C 24.3894100189209 4.10459566116333 23.4586296081543 4.020693302154541 22.68081855773926 4.409602165222168 C 21.90301132202148 4.798510551452637 21.41167068481445 5.593480110168457 21.41163635253906 6.463099956512451 L 21.41163444519043 20.23863983154297 L 12.84017562866211 13.8100757598877 C 11.82575798034668 13.04924774169922 10.38663673400879 13.2548246383667 9.625808715820312 14.26924228668213 C 8.864980697631836 15.28366088867188 9.070557594299316 16.7227840423584 10.08497619628906 17.48361015319824 L 19.88097190856934 24.83058929443359 L 10.08497714996338 32.17756652832031 C 9.070557594299316 32.93839263916016 8.86497974395752 34.37751388549805 9.625808715820312 35.39192962646484 C 10.38663578033447 36.40635299682617 11.82575798034668 36.6119270324707 12.84017753601074 35.85110092163086 L 21.41163444519043 29.42257690429688 L 21.41163444519043 43.19813919067383 C 21.4116325378418 44.06774139404297 21.90296363830566 44.86274337768555 22.6807861328125 45.25167465209961 C 23.45864677429199 45.64059829711914 24.38944816589355 45.55667877197266 25.08516502380371 45.03490447998047 L 37.33016204833984 35.85115814208984 C 37.90826797485352 35.41753768920898 38.24849319458008 34.73705291748047 38.24849319458008 34.01439666748047 C 38.24849319458008 33.2917366027832 37.90826797485352 32.61124801635742 37.33015441894531 32.17762756347656 Z M 26.00350570678711 38.60612869262695 L 26.00350570678711 29.42238426208496 L 32.12600326538086 34.01425552368164 L 26.00350570678711 38.60612869262695 Z M 46.75972366333008 18.61476135253906 C 47.65634536743164 19.51138877868652 47.65634536743164 20.96510887145996 46.75971984863281 21.86173629760742 C 45.86309432983398 22.75835990905762 44.40937423706055 22.75836181640625 43.51274871826172 21.86173629760742 L 40.54442977905273 18.89335441589355 L 37.5760383605957 21.86175155639648 C 36.67940902709961 22.75838088989258 35.2256965637207 22.75838088989258 34.32906341552734 21.86175346374512 C 33.43244552612305 20.96512794494629 33.43244552612305 19.51141166687012 34.32906341552734 18.61478424072266 L 37.29740905761719 15.64638423919678 L 34.32914352416992 12.67800712585449 C 33.43251419067383 11.78138065338135 33.43251419067383 10.32766151428223 34.32913970947266 9.431035995483398 C 35.22576522827148 8.534409523010254 36.67948532104492 8.534408569335938 37.57611083984375 9.431035995483398 L 40.54442977905273 12.39941501617432 L 43.5128288269043 9.431018829345703 C 44.40945434570312 8.534392356872559 45.86317443847656 8.534393310546875 46.75979995727539 9.43101978302002 C 47.65642547607422 10.32764434814453 47.65642547607422 11.78136444091797 46.75979995727539 12.67799091339111 L 43.79145431518555 15.64638423919678 L 46.75972366333008 18.61476135253906 Z" fill="#ff3366" stroke="none" stroke-width="0.2083330899477005" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ls6vgs =
    '<svg viewBox="76.2 154.7 101.0 101.0" ><path transform="translate(76.15, 154.65)" d="M 50.5 0 C 78.39037322998047 0 101 22.60961723327637 101 50.49999237060547 C 101 78.39035797119141 78.39037322998047 100.9999847412109 50.5 100.9999847412109 C 22.60962104797363 100.9999847412109 0 78.39035797119141 0 50.49999237060547 C 0 22.60961723327637 22.60962104797363 0 50.5 0 Z" fill="#fff3f6" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_binfc6 =
    '<svg viewBox="796.6 380.3 10.5 1.0" ><path transform="translate(796.55, 380.33)" d="M 10.49000263214111 0 L 0 0" fill="none" stroke="#1b2428" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_qm7j48 =
    '<svg viewBox="802.3 375.7 4.5 4.5" ><path transform="translate(802.32, 375.71)" d="M 0 0 L 4.472747325897217 4.472747325897217" fill="none" stroke="#1b2428" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_yae6qy =
    '<svg viewBox="803.2 380.3 3.8 4.5" ><path transform="translate(803.22, 380.33)" d="M 0 4.469630718231201 L 3.816622495651245 0" fill="none" stroke="#1b2428" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_xgsis =
    '<svg viewBox="0.0 0.2 12.0 12.0" ><path  d="M 11.5588960647583 9.431726455688477 L 8.206173896789551 6.053415775299072 L 11.31733989715576 2.918979406356812 C 11.90594005584717 2.326748371124268 11.90594005584717 1.366137385368347 11.31733989715576 0.7733926177024841 C 10.72925186157227 0.1809046417474747 9.775771141052246 0.1811614185571671 9.188192367553711 0.7733926177024841 L 6.076515674591064 3.907828569412231 L 2.812721967697144 0.619365930557251 C 2.224377155303955 0.02687794528901577 1.2708979845047 0.02687794528901577 0.6830631494522095 0.619365930557251 C 0.09522858262062073 1.212110638618469 0.09522858262062073 2.172208070755005 0.6830631494522095 2.764952659606934 L 3.947112798690796 6.053415775299072 L 0.4415081739425659 9.584981918334961 C -0.1468360871076584 10.1779842376709 -0.1468360871076584 11.13808059692383 0.4415081739425659 11.73082733154297 C 1.029597878456116 12.32305812835693 1.982822299003601 12.32305812835693 2.570657253265381 11.73082733154297 L 6.076516628265381 8.199002265930176 L 9.429746627807617 11.57731342315674 C 10.01783657073975 12.16980171203613 10.97106075286865 12.16980171203613 11.5588960647583 11.57731342315674 C 12.14749526977539 10.98431205749512 12.14724063873291 10.02370166778564 11.5588960647583 9.431726455688477 Z" fill="#1b2428" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
