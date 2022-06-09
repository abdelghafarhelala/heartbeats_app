import 'package:flutter/material.dart';
import 'package:heartbeats_app/screens/emergency_screen/emergencyScreen.dart';
import 'package:heartbeats_app/screens/python_fliter/filter_signals_data_screen%20copy.dart';
import 'package:heartbeats_app/screens/python_fliter/filter_signals_data_screen.dart';
import 'package:heartbeats_app/screens/questions_screen/questionScreen.dart';
import 'package:heartbeats_app/shared/cubit/cubit.dart';
import 'package:url_launcher/url_launcher.dart';

List bagg = [
  3220,
  319,
  324,
  317,
  304,
  308,
  308,
  308,
  298,
  290,
  296,
  296,
  296,
  379,
  370,
  340,
  360,
  345,
  376,
  367,
  390,
  376,
  456,
  367,
  345,
  365,
  346,
  370
];

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
                prefixIcon: const AssetImage('assets/images/ambulance.png'),
                title: 'Emergency',
                context: context,
                widget: const EmergencyScreen(title: 'Setting')),
            const SizedBox(
              height: 10,
            ),
            buildSettingItem(
                prefixIcon: const AssetImage('assets/images/question.png'),
                title: 'How to use',
                context: context,
                widget: const QuestionsScreen(title: 'FAQs')),
            const SizedBox(
              height: 20,
            ),
            buildSettingItem(
                prefixIcon: const AssetImage('assets/images/internet.png'),
                title: 'Website',
                context: context),
            const SizedBox(
              height: 20,
            ),
            // buildSettingItem(
            //     prefixIcon: AssetImage('assets/images/ambulance.png'),
            //     title: 'Test csv',
            //     context: context,
            //     widget: FilterSignalsData()),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                _launchUrl2(
                    context, 'https://heart-attack-a0951.web.app/contact');
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFe1f1ff),
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
              ),
            ),
            MaterialButton(
              onPressed: () {
                FilterSignalsDataState().run2(bagg);
              },
              child: Text('test'),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}

Widget buildSettingItem(
        {required AssetImage? prefixIcon,
        required String? title,
        Widget? widget,
        required context}) =>
    InkWell(
      onTap: () {
        if (title == 'Website') {
          _launchUrl2(context, 'https://heart-attack-a0951.web.app/');
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              if (title == 'Emergency') {
                AppCubit.get(context)
                    .getDataFromPhones(AppCubit.get(context).database);
              }
              return widget!;
            }),
          );
        }
      },
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            ImageIcon(prefixIcon),
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

void _launchUrl2(context, url) async {
  if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
}
