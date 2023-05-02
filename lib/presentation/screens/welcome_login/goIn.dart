
/// Validation Test
import 'package:flutter/material.dart';

import '../home/home.dart';

class GoIn extends StatefulWidget {
  const GoIn({Key? key}) : super(key: key);

  @override
  State<GoIn> createState() => _GoInState();
}
var emailController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class _GoInState extends State<GoIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 100),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  validator: (value){
                    if(value==null || value.isEmpty)
                      {
                        return 'Email must not be empty';
                      }
                    return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),


                ),
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  validator: (value){
                    if(value==null || value.isEmpty)
                    {
                      return 'Email must not be empty';
                    }
                    return null;
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),


                ),
              ),
              const SizedBox(height: 20,),
              MaterialButton(
                  color: Colors.indigo,
                  onPressed: (){
                    if(!formKey.currentState!.validate())
                      {
                        return;
                      }
                    else
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                      }
                  },
                  child: const Text('Sign in'))
            ],
          ),
        ),
      ),
    );
  }
}
