import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heartbeats_app/screens/splash/splash_screen.dart';
import 'package:heartbeats_app/shared/cubit/cubit.dart';
import 'package:heartbeats_app/shared/cubit/states.dart';
import 'package:heartbeats_app/shared/shared_preferences/cache_Helper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneOneController = TextEditingController();
    var phoneTwoController = TextEditingController();
    var formkey = GlobalKey<FormState>();
    void submit() {
      CacheHelper.sharedPreferences.setBool('onBoarding', true);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SplashScreen(),
          ));
    }

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        submit();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'Skip',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 300,
                      // width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/board.png'),
                              fit: BoxFit.none)),
                    ),
                    const Text(
                      'Emergency handling',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      '''From ECG in case of a health crisis, a recorded message will be sent to these numbers''',
                      style: TextStyle(
                          fontSize: 17,
                          // fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: phoneOneController,
                      decoration: const InputDecoration(
                          label: Text('Phone number 1'),
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.phone,
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'Phone 1 can not be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: phoneTwoController,
                      decoration: const InputDecoration(
                          label: Text('Phone number 2'),
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.phone,
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'Phone 2 can not be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    MaterialButton(
                      minWidth: 150,
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.blue,
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          CacheHelper.sharedPreferences
                              .setBool('onBoarding', true);
                          AppCubit.get(context).insertToDatabaseToPhones(
                              phone1: phoneOneController.text,
                              phone2: phoneTwoController.text);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SplashScreen(),
                              ));
                        }
                      },
                      child: const Text('Save&start',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
