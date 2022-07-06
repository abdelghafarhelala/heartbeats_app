import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heartbeats_app/components/components.dart';
import 'package:heartbeats_app/shared/cubit/cubit.dart';
import 'package:heartbeats_app/shared/cubit/states.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';

class EmergencyScreen extends StatefulWidget {
  final title;
  const EmergencyScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppUpdateDatabaseState) {
          showToast(text: 'Updated successfully', state: ToastStates.success);
        }
      },
      builder: (context, state) {
        var phone1Controller = TextEditingController();
        var phone2Controller = TextEditingController();
        if (AppCubit.get(context).phones.isNotEmpty) {
          phone1Controller.text = AppCubit.get(context).phones[0]['phone1'];
          phone2Controller.text = AppCubit.get(context).phones[0]['phone2'];
        }
        return Scaffold(
          body: Container(
            // alignment: Alignment.center,
            margin: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
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
                          'Emergency',
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
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Phone number 1',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Phone one'),
                            border: OutlineInputBorder(),
                          ),
                          controller: phone1Controller,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Phone number 2',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                              label: Text('Phone two'),
                              border: OutlineInputBorder(),
                            ),
                            controller: phone2Controller),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: 150,
                    height: 50,
                    child: MaterialButton(
                      onPressed: () {
                        AppCubit.get(context).updateDatabaseToPhones(
                            phone1: phone1Controller.text,
                            phone2: phone2Controller.text,
                            id: 1);
                        setState(() {
                          AppCubit.get(context).getDataFromPhones(
                              AppCubit.get(context).database);
                        });
                      },
                      child: const Text(
                        'Save changes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
