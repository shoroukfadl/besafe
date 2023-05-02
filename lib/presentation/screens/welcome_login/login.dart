
import 'dart:io';

import 'package:besafe/presentation/screens/welcome_login/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/component.dart';
import '../mqtt/mqtt/MQTTManager.dart';
import '../mqtt/mqtt/state/MQTTAppState.dart';


class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with ChangeNotifier {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordShow = true;
  late MQTTAppState currentAppState;
  late MQTTManager manager;
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const Auth()));
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
  void _buildConnect(MQTTAppConnectionState state) {
    state == MQTTAppConnectionState.disconnected
        ? _configureAndConnect
        : null;

  }
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    currentAppState = appState;
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/login.png',
                            scale: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: emailController,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'you must write email';
                            } else if (value
                                .split('@')
                                .last != 'gmail.com') {
                              return 'email must end with @gmail.com';
                            } else {
                              return null;
                            }
                          },

                          type: TextInputType.emailAddress,
                          label: 'Email',
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),
                        defaultFormField(
                          controller: passwordController,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'you must write Password';
                            } else {
                              return null;
                            }
                          },
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          prefix: Icons.password,
                          suffix: Icons.visibility,
                          //  obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        // GestureDetector(
                        //   onTap: signIn ,
                        //   child:
                        defaultButton(
                            text: 'Sign In',
                            function: () {
                                    signIn().then((value) {
                                      try {
                                        _buildConnect(
                                            currentAppState
                                                .getAppConnectionState);
                                        print("connect");
                                      }catch(e){
                                        print("error is $e");
                                      }
                                    });
                                    },
                            radius: 20),
                        // ),
                      ],
                    )),
              ],
            ),
          ),
        ),

      ),
    );
  }


}
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => LoginCubit(),
//       child: BlocConsumer<LoginCubit, LoginState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           return Scaffold(
//           backgroundColor: Colors.indigo.shade50,
//           body: SafeArea(
//               child: Container(
//                 margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                           child: ListView(
//                             physics: const BouncingScrollPhysics(),
//                             children: [
//                               Center(
//                                 child: Image.asset(
//                                   'assets/images/login.png',
//                                   scale: 1,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
          
//                               defaultFormField(
//                                 controller: emailController,
//                                 // validate: (value) {
//                                 //   if(value==null || value.isEmpty)
//                                 //     {}
//                                 // },
//    validate: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'you must write email';
//                     } else if (value.split('@').last != 'gmail.com') {
//                       return 'email must end with @gmail.com';
//                     } else {
//                       return null;
//                     }
//                   },



//                               //       validate: (value) {
//                               // if(value==null || value.isEmpty)
//                               //   {}
//                               //       },
//                                 type: TextInputType.emailAddress,
//                                 label: 'Email',
//                                 prefix: Icons.email_outlined,
//                               ),
//                               const SizedBox(height: 20),
//                               defaultFormField(
//                                   controller: passwordController,
//                                     suffix: isPasswordShow? Icons.visibility :Icons.visibility_off,
                               
//                                   suffixPressed: (){
//                                     setState(() {
//                                        isPasswordShow = !isPasswordShow;
//                                     });
                                 
//                                   },
                                  
//                                   // validate: (value) {},
//                                                     validate: (value) {
//                     if (value == null || value.isEmpty ) {
//                       return 'you must write Password';
//                     } else {
//                       return null;
//                     }
//                   },
//                                   type: TextInputType.visiblePassword,
//                                   // onSubmit:
//                                   isPassword: isPasswordShow,
//                                   label: 'Password',
                                  
//                                   prefix: Icons.password,
                                
               
//                                 //  obscureText: true,
//                               ),
//                               const SizedBox(height: 20),
//                              ConditionalBuilder(
//                               condition: State is! LoginLoadingState,
//                             builder: (context)=>   defaultButton(
//                                   text: 'Sign In',
//           //                         function: () {
//           //  if (formKey.currentState!.validate())
//           //                           Navigator.push(
//           //                               context,
//           //                               MaterialPageRoute(
//           //                                   builder: (context) => const Home()));
//           //                         },
//                        function: (){
//                                  if (formKey.currentState!.validate()) {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (_) => Home()));
//                     }
//                               },
//                                   radius: 20),
//                              fallback: (context) => CircularProgressIndicator() ,
//                             ),

//                               // defaultButton(
//                               //     text: 'Sign In',
//                               //     function: () {
          
//                               //       Navigator.push(
//                               //           context,
//                               //           MaterialPageRoute(
//                               //               builder: (context) => const Home()));
//                               //     },
//                               //     radius: 20),
//                             ],
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
          
//           ),
//         );
//         },
//       ),
//     );
//   }
// }
  
     
     
     
     
     
     
     
     


// class Login extends StatefulWidget {
//   const Login({super.key});
//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   // var emailController = TextEditingController();
//   // var passwordController = TextEditingController();
//   // var formKey = GlobalKey<FormState>();
//     late TextEditingController emailController;
//   late TextEditingController passwordController;

//   bool _obsecured = true;

//   var _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.indigo.shade50,
//       body: SafeArea(
//           child: Container(
//             margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                       child: ListView(
//                         physics: const BouncingScrollPhysics(),
//                         children: [
//                           Center(
//                             child: Image.asset(
//                               'assets/images/login.png',
//                               scale: 1,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),

//                           // defaultFormField(
//                           //   controller: emailController,
//                           //   validate: (value) {
//                           //     if(value==null || value.isEmpty)
//                           //       {}
//                           //   },
//                           //   type: TextInputType.emailAddress,
//                           //   label: 'Email',
//                           //   prefix: Icons.email_outlined,
//                           // ),
//                            TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   controller: emailController,
//                   decoration: InputDecoration(
//                       suffixIcon: Icon(Icons.verified_user),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.lightBlue),
//                           borderRadius: BorderRadius.circular(25)),
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.lightBlue),
//                           borderRadius: BorderRadius.circular(25)),
//                       labelText: 'email',
//                       hintText: 'write your name....'),
//                   keyboardType: TextInputType.name,
//                   textInputAction: TextInputAction.newline,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'you must write email';
//                     } else if (value.split('@').last != 'gmail.com') {
//                       return 'email must end with @gmail.com';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                           const SizedBox(height: 20),
//                               TextFormField(
//                   obscureText: _obsecured,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                       suffixIcon: InkWell(
//                           onTap: () {
//                             setState(() {
//                               _obsecured = !_obsecured;
//                             });
//                           },
//                           child: Icon(_obsecured
//                               ? Icons.visibility_off
//                               : Icons.visibility)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.lightBlue),
//                           borderRadius: BorderRadius.circular(25)),
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.lightBlue),
//                           borderRadius: BorderRadius.circular(25)),
//                       labelText: 'password',
//                       hintText: 'write your password....'),
//                   keyboardType: TextInputType.name,
//                   textInputAction: TextInputAction.newline,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'you must write Password';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                           // defaultFormField(
                            
//                           //     controller: passwordController,
//                           //     validate: (value) {},
//                           //     type: TextInputType.visiblePassword,
//                           //     label: 'Password',
//                           //     prefix: Icons.password,
//                           //     suffix: Icons.visibility,
//                           //   //  obscureText: true,
//                           // ),
//                           const SizedBox(height: 20),
//                           defaultButton(
//                               text: 'Sign In',
//                               function: (){
//                                  if (_formKey.currentState!.validate()) {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (_) => Home()));
//                     }
//                               },
//                               // function: () {

//                               //   Navigator.push(
//                               //       context,
//                               //       MaterialPageRoute(
//                               //           builder: (context) => const Home()));
//                               // },
//                               radius: 20),
//                         ],
//                       )),
//                 ],
//               ),
//             ),
//           ),

//       ),
//     );
//   }
// }
