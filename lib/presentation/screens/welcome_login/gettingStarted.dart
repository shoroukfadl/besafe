import 'package:flutter/material.dart';
import '../../../components/component.dart';
import 'login.dart';
import 'registration.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Container(
        margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/w.png',
                // scale: 1.5,
              ),
            ),
            const Center(
              child: Text(
                'Be Safe',
                style: TextStyle(
                    fontSize: 30,
                    textBaseline: TextBaseline.alphabetic,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            defaultButton(
                text: 'Sign In',
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Login()));
                },
                radius: 30,
                width: 200),
            const SizedBox(
              height: 10,
            ),
            defaultButton(
              text: 'Sign Up',
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Registration()));
              },
              radius: 30,
              width: 200,
            ),
          ],

        ),
      ),
    );
  }
}
