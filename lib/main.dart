import 'package:besafe/ap_route.dart';
import 'package:besafe/presentation/screens/des.dart';

import 'package:besafe/presentation/screens/mqtt/mqtt/state/MQTTAppState.dart';
import 'package:besafe/presentation/screens/mqtt/mqtt/x.dart';
import 'package:besafe/presentation/screens/welcome_login/auth.dart';
import 'package:besafe/presentation/screens/home/home.dart';
import 'package:besafe/presentation/screens/welcome_login/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:besafe/bloc_observer.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/mqtt/2.dart';
import 'presentation/screens/welcome_login/welcome.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
//  await GetStorage.init();
  Bloc.observer =MyBlocObserver();
 runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MQTTAppState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MQTTView4(),
      ),
    );
  }
}







