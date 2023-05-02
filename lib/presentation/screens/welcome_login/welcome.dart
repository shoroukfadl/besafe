import 'package:flutter/material.dart';

import '../../../components/component.dart';
import 'gettingStarted.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          //padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Center(
                child: Image.asset(
                  'assets/images/smart-home.png',
                  scale: .1,
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.indigo,
                  ),
                  child: defaultButton(
                      text: 'GET SMART',
                      fontColor: Colors.indigo,
                      size: 23,
                      height: 55,
                      width: 200,
                      radius: 40,
                      background: Colors.indigo.shade50,
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GettingStarted()));
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
