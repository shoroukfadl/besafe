///TEST
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';
//
// class ServerConnect extends StatefulWidget {
//   const ServerConnect({Key? key}) : super(key: key);
//
//   @override
//   State<ServerConnect> createState() => _ServerConnectState();
// }
//   MqttServerClient? client;
//
// class _ServerConnectState extends State<ServerConnect> {
//   mqttConnect() async {
//     client = MqttServerClient('server', 'clientIdentifier');
//     client!.onConnected = onConnected;
//     try{
//       await client!.connect();
//     } on NoConnectionException catch(error){
//       log(error.toString());
//     }
//
//     client!.subscribe('topic', MqttQos.exactlyOnce);
//     client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> mqttReceivedMessage)
//     {
//       final MqttReceivedMessage recMes = mqttReceivedMessage[0].payload as MqttReceivedMessage;
//       var payload = MqttPublishPayload.bytesToString(recMes.payload.message);
//       log(payload);
//     });
//   }
//   void onConnected() {
//     log('Connected');
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     mqttConnect();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FloatingActionButton(
//           child: const Icon(Icons.send),
//           onPressed: () {
//             client!.onConnected!();
//           },),
//       ),
//     );
//   }
//
//
// }
