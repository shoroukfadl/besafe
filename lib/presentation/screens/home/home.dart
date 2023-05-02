
import 'dart:io';

import 'package:besafe/components/functions.dart';
import 'package:besafe/presentation/screens/defultinapp/edit_profile.dart';
import 'package:besafe/presentation/screens/defultinapp/settings.dart';
import 'package:besafe/presentation/screens/mqtt/mqtt/MQTTManager.dart';
import 'package:besafe/presentation/screens/mqtt/mqtt/state/MQTTAppState.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controls/bedRoom.dart';
import '../controls/doors.dart';
import '../controls/living.dart';
import '../controls/reception.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user =FirebaseAuth.instance.currentUser!;

  List<Widget> screens = [
    const Living(),
    const Reception(),
    const BedRoom(),
    const Door(),
  ];

  List<String> titles = ['Living Room', 'Reception', 'Bed Room', 'Doors'];
  int current = 0;

   @override

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 15,bottom: 10,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:const   [
                  Text(
                    'WELCOME HOME',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 135,
                    child: Icon(
                      Icons.bar_chart_rounded,
                      color: Colors.indigo,
                      size: 28,
                    ),
                  )
         
          // IconButton(
          //   icon: Icon(
          //     Icons.bar_chart_rounded,
          //     color: Colors.indigo,
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => SettingsPage()));
          //   },
          // ),
       
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                height: 105,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Current Temperature',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: const [
                          Text(
                            '0\u00B0',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: titles.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      margin: const EdgeInsets.all(5),
                                      width: 100,
                                      height: 40,
                                     decoration: BoxDecoration(
                                         color: current == index
                                        ? Colors.white
                                        : Colors.indigo.shade50,
                                     borderRadius:
                                     current == index
                                        ? BorderRadius.circular(20)
                                        : BorderRadius.circular(20),
                                     border: current == index
                                        ? Border.all(
                                        color: Colors.indigo, width: 2)
                                        : null,
                                      ),

                                      child: Center(
                                        child: Text(titles[index]),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: current == index,
                                      child: Container(
                                        width: 5,
                                        height: 5,
                                        decoration: const BoxDecoration(
                                            color: Colors.indigo,
                                            shape: BoxShape.circle),
                                      ))
                                ],
                              );
                            }),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        height: 500,
                        child: screens[current],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
      /*
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.indigo.shade50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.indigo,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.indigo,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Settings()));
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),

       */
    );
  }
}