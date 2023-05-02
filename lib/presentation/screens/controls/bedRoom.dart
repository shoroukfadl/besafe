
import 'dart:io';

import 'package:besafe/business_logic/cubit/cubit_cubit.dart';
import 'package:besafe/presentation/screens/mqtt/1.dart';
import 'package:besafe/services/app_services.dart';
// import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:provider/provider.dart';
import 'package:typed_data/src/typed_buffer.dart';

import '../../../components/functions.dart';
import '../mqtt/mqtt/MQTTManager.dart';
import '../mqtt/mqtt/state/MQTTAppState.dart';

class BedRoom extends StatefulWidget {
  const BedRoom({Key? key}) : super(key: key);

  @override
  State<BedRoom> createState() => _BedRoomState();
}

class _BedRoomState extends State<BedRoom> {
  // bool value1 = false;
  // bool value2 = false;
  // bool value3 = false;
  // bool value4 = false;
@override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.indigo.shade50,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Control Your Bed Room',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.indigo
            // fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 155,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Light',
                                style:
                                TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                              Icon(
                                Icons.light_mode,
                                color: Colors.yellow,
                                size: 35,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                                ]
                              )
                            ],
                          ),

                      ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: 155,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'AC',
                                style:
                                TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                              Icon(
                                Icons.ac_unit,
                                color: Colors.indigo,
                                size: 35,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // ElevatedButton(
                              //   onPressed: (){ OnCubit.get(context).on2();}
                              // , child: child)
                                                              Switch(
                                value: SwitchValues.value10,
                                onChanged: (val) {
                                    setState(() {
                                       SwitchValues.value10= val;
                                  });

                                })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: 155,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'TV',
                                style:
                                TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                              Icon(
                                Icons.tv_rounded,
                                color: Colors.indigo,
                                size: 35,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                                               Switch(
                                value: SwitchValues.value11,
                                onChanged: (val) {
                                    setState(() {
                                       SwitchValues.value11 = val;
                                  });

                                })
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: 155,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Door',
                                style:
                                TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                              Icon(
                                Icons.sensor_door_outlined,
                                color: Colors.indigo,
                                size: 35,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                                               Switch(
                                value: SwitchValues.value12,
                                onChanged: (val) {
                                    setState(() {
                                       SwitchValues.value12= val;
                                  });

                                })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ],
    ),
    );
  }
}
