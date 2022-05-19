import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:heartbeats_app/constants.dart';
import 'package:heartbeats_app/screens/connect_serial/ChatPage.dart';
import 'package:heartbeats_app/screens/connect_serial/SelectBondedDevicePage.dart';
import 'package:heartbeats_app/screens/connect_serial/syncfusion_chart.dart';

class ChechkBluetoothDialog extends StatelessWidget {
  const ChechkBluetoothDialog({Key? key}) : super(key: key);
  void _startChat(BuildContext context, BluetoothDevice server) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SyncfusionChart(server: server);
          //return ChatPage(server: server);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: const Duration(milliseconds: 200),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 7,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
        height: 420,
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/g1.png',
                  height: 130,
                  width: 120,
                ),
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Bluetooth not connected!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16, left: 16),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur adipiscing elit urna velit amet tempor egestas fringilla bibendum vel nisl.',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(250, 50)),
                      elevation: MaterialStateProperty.all(7),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(secondColor),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(left: 30, right: 30))),
                  onPressed: () {
                    future() async {
                      // async lambda seems to not working
                      await FlutterBluetoothSerial.instance.requestEnable();
                      final BluetoothDevice? selectedDevice =
                          await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SelectBondedDevicePage(
                                checkAvailability: false);
                          },
                        ),
                      );

                      if (selectedDevice != null) {
                        print('Connect -> selected ' + selectedDevice.address);
                        _startChat(context, selectedDevice);
                        Navigator.of(context).pop();
                      } else {
                        print('Connect -> no device selected');
                      }
                    }

                    future().then((_) {
                      Navigator.of(context).pop();
                      // setState(() {});
                    });
                    //return Navigator.of(context).pop(true);
                  },
                  child: const Text(
                    'Connect Bluetooth',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      const Text(
                        'Review Steps',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
