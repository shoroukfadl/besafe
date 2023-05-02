
import 'dart:io';

import 'package:besafe/presentation/screens/connect.dart';
import 'package:besafe/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../mqtt/mqtt/MQTTManager.dart';
import '../mqtt/mqtt/state/MQTTAppState.dart';


class Living extends StatefulWidget {
     // ignore: use_key_in_widget_constructors
    //  const GetStorage.init();
  const Living({super.key});

  @override
  State<Living> createState() => _LivingState();
}

class _LivingState extends State<Living> {

  late MQTTAppState currentAppState;
  late MQTTManager manager;
  bool value= false;


  void publishMessage(String text) {

    String osPrefix = 'Flutter_Android';

    if (Platform.isAndroid) {
      osPrefix = 'Flutter_iOS';
    }
    final String message = osPrefix + ' says: ' + text;
    manager.publish(message);
  }

  void SwitchWith(bool value ,MQTTAppConnectionState state) {
          if(state == MQTTAppConnectionState.connected && value ==true)
            publishMessage(value.toString());
          else if(state == MQTTAppConnectionState.connected && value != true)
            publishMessage(value.toString());
  }

  void _configureAndConnect() {
    String  osPrefix = 'Flutter_Android';
    if (Platform.isAndroid) {
      osPrefix = 'Flutter_iOS';
    }
    manager = MQTTManager(
        host: "91.121.93.94",
        topic: "ss",
        identifier: osPrefix,
        state: currentAppState);
    try {
      manager.initializeMQTTClient();
      manager.connect();
      print("connection");
    }catch(e)
    {
      print("error is $e");
    }

  }
   _buildConnect(MQTTAppConnectionState state) {
    state == MQTTAppConnectionState.disconnected
        ? _configureAndConnect
        : null;

  }
 
  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    currentAppState = appState;

    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Control Your Living Room',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.indigo
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
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
                                  Switch(
                                      value: SwitchValues.value1,
                                      onChanged: (val) {
                                        _buildConnect(currentAppState.getAppConnectionState);
                                        setState(() {
                                          SwitchValues.value1 = val;
                                          try {
                                            SwitchWith(SwitchValues.value1 ,currentAppState.getAppConnectionState);
                                            print("${currentAppState.getAppConnectionState.toString()}");
                                          }catch(e)
                                          {
                                            print("error $e");
                                          }
                                        });
                                        }),

                                  // LiteRollingSwitch(
                                     
                                  //   onTap: (_), onDoubleTap: (_), onSwipe: (_), onChanged: (_)
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
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
                                  Switch(
                                      value: SwitchValues.value2,
                                      onChanged: (val) {

                                          setState(() {
                                             SwitchValues.value2 = val;
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
                                      value: SwitchValues.value3,
                                      onChanged: (val) {
                                          setState(() {
                                             SwitchValues.value3 = val;
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
                                      value: SwitchValues.value4,
                                      onChanged: (val) {
                                           setState(() {
                                             SwitchValues.value4 = val;
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
      ),
    );
  }
}
