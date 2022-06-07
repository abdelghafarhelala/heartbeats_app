import 'package:flutter/material.dart';
import 'package:heartbeats_app/screens/emergency_screen/emergencyScreen.dart';
import 'package:heartbeats_app/screens/python_fliter/filter_signals_data_screen.dart';
import 'package:heartbeats_app/screens/questions_screen/questionScreen.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';

class Profile extends StatefulWidget {
  final title;
  const Profile({Key? key, required this.title}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Setting',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            buildSettingItem(
                prefixIcon: HumanitarianIcons.ambulance,
                title: 'Emergency',
                context: context,
                widget: const EmergencyScreen(title: 'Setting')),
            const SizedBox(
              height: 10,
            ),
            buildSettingItem(
                prefixIcon: Icons.question_mark_rounded,
                title: 'FAQs',
                context: context,
                widget: const QuestionsScreen(title: 'FAQs')),
            const SizedBox(
              height: 20,
            ),
            buildSettingItem(
                prefixIcon: Icons.language, title: 'Website', context: context),
            const SizedBox(
              height: 20,
            ),
            buildSettingItem(
                prefixIcon: Icons.question_mark_outlined,
                title: 'Test csv',
                context: context,
                widget: FilterSignalsData()),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFe1f1ff),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.headphones_outlined,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Feel free to ask, We ready to help',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildSettingItem(
        {required IconData? prefixIcon,
        required String? title,
        Widget? widget,
        required context}) =>
    InkWell(
      onTap: () {
        if (title == 'Website') {
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget!),
          );
        }
      },
      child: Container(
        height: 50,
        child: Row(
          children: [
            Icon(
              // HumanitarianIcons.ambulance,
              prefixIcon!,
              color: Colors.black54,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                title!,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
