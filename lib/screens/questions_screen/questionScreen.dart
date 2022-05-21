import 'package:flutter/material.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';

class QuestionsScreen extends StatefulWidget {
  final title;
  const QuestionsScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

bool isExpanded1 = false;
bool isExpanded2 = false;
bool isExpanded3 = false;
bool isExpanded4 = false;
bool isExpanded5 = false;

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          // margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black87,
                        )),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Setting',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              buildQuestionItem(
                  isExpanded: isExpanded1,
                  question: 'Why EGC doesn\'t appear ?',
                  onTap: () {
                    setState(() {
                      isExpanded1 = !isExpanded1;
                    });
                  }),
              const SizedBox(
                height: 5,
              ),
              buildQuestionItem(
                  isExpanded: isExpanded2,
                  question: 'What is the min & max heart rate ?',
                  onTap: () {
                    setState(() {
                      isExpanded2 = !isExpanded2;
                    });
                  }),
              const SizedBox(
                height: 5,
              ),
              buildQuestionItem(
                  isExpanded: isExpanded3,
                  question: 'How can i share results with my doctor ?',
                  onTap: () {
                    setState(() {
                      isExpanded3 = !isExpanded3;
                    });
                  }),
              const SizedBox(
                height: 5,
              ),
              buildQuestionItem(
                  isExpanded: isExpanded4,
                  question: 'How can i get the EGC sensor of app ?',
                  onTap: () {
                    setState(() {
                      isExpanded4 = !isExpanded4;
                    });
                  }),
              const SizedBox(
                height: 5,
              ),
              buildQuestionItem(
                  isExpanded: isExpanded5,
                  question: 'What is emergency number required ?',
                  onTap: () {
                    setState(() {
                      isExpanded5 = !isExpanded5;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildQuestionItem(
        {required String question,
        required Function onTap,
        required bool isExpanded}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFeaf7ee),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    // 'Why EGC doesn\'t appear ?',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      // setState(() {
                      //   isExpanded = !isExpanded;
                      // });
                      onTap();
                    },
                    icon: Icon(
                      isExpanded ? Icons.minimize_outlined : Icons.add,
                      size: 25,
                    )),
              ],
            ),
            if (isExpanded)
              const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              )
          ],
        ),
      ),
    );
