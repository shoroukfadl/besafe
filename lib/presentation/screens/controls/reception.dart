
import 'package:besafe/services/app_services.dart';
import 'package:flutter/material.dart';

class Reception extends StatefulWidget {
  const Reception({Key? key}) : super(key: key);

  @override
  State<Reception> createState() => _ReceptionState();
}

class _ReceptionState extends State<Reception> {
  var value = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  @override
  Widget build(BuildContext context) {
    // Widget buildSwitch() => Switch.adaptive(
    // thumbColor: MaterialStateProperty.all(Colors.red),
    //trackColor: MaterialStateProperty.all(Colors.orange),

    // activeColor: Colors.blueAccent,
    // activeTrackColor: Colors.blue.withOpacity(0.4),
    // inactiveThumbColor: Colors.orange,
    // inactiveTrackColor: Colors.black87,
    // splashRadius: 50,
    //value: value,
    //onChanged: (value) => setState(() => this.value = value),
    // );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade50,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Control Your Reception ',
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
                  physics: const BouncingScrollPhysics(),
                  children: [
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
                                      value: SwitchValues.value5,
                                      onChanged: (val) {
                                          setState(() {
                                             SwitchValues.value5 = val;
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
                                      value: SwitchValues.value6,
                                      onChanged: (val) {
                                          setState(() {
                                             SwitchValues.value6 = val;
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
                                      value: SwitchValues.value7,
                                      onChanged: (val) {
                                          setState(() {
                                             SwitchValues.value7 = val;
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
                                      value: SwitchValues.value8,
                                      onChanged: (val) {
                                          setState(() {
                                             SwitchValues.value8 = val;
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