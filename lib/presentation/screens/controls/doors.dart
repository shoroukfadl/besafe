import 'package:besafe/services/app_services.dart';
import 'package:flutter/material.dart';

class Door extends StatefulWidget {
  const Door({Key? key}) : super(key: key);

  @override
  State<Door> createState() => _DoorState();
}

class _DoorState extends State<Door> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Control Your Doors',
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
                        padding: const EdgeInsets.only(left: 10),
                        width: 330,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Main Door',
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                                ),
                                                               Switch(
                                      value: SwitchValues.value13,
                                      onChanged: (val) {
                                          setState(() {
                                             SwitchValues.value13 = val;
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
                        padding: const EdgeInsets.only(left: 10),
                        width: 330,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Living Room\'s Door',
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                                ),
                                                               Switch(
                                      value: SwitchValues.value14,
                                      onChanged: (val) {
                                          setState(() {
                                             SwitchValues.value14 = val;
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
                        padding: const EdgeInsets.only(left: 10),
                        width: 330,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Bed Room\'s Door',
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                                ),
                                                                Switch(
                                      value: SwitchValues.value15,
                                      onChanged: (val) {
                                          setState(() {
                                             SwitchValues.value15= val;
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
                        padding: const EdgeInsets.only(left: 10),
                        width: 330,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Reception\'s Door',
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                                ),
                                                               Switch(
                                      value: SwitchValues.value16,
                                      onChanged: (val) {
                                          setState(() {
                                             SwitchValues.value16 = val;
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
