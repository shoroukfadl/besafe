import 'dart:io' show Platform;
import 'package:besafe/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mqtt/mqtt/MQTTManager.dart';
import '../mqtt/mqtt/state/MQTTAppState.dart';



class MQTTView4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState(

      ) {
    return _MQTTView4State();
  }
}

class _MQTTView4State extends State<MQTTView4> {
  bool passtoggle = false;
  late MQTTAppState currentAppState;
  late MQTTManager manager;
  bool value9= false;
  bool value2= false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    currentAppState = appState;
    return Scaffold(
        backgroundColor: Colors.indigo.shade50,
        body: SafeArea(child: buildColumn()));
  }



  Widget buildColumn() {
    return Column(
      children: <Widget>[
        buildConnectionStateText(
            prepareStateMessageFrom(currentAppState.getAppConnectionState)),
        SizedBox(height: 20,),
        buildEditableColumn(),
        buildScrollableTextWith(currentAppState.getHistoryText)
      ],
    );
  }

  Widget buildEditableColumn() {
    return   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Center(
            child: Row(
              children: const [
                Text(
                  'Light',
                  style:
                  TextStyle(fontSize: 50, color: Colors.grey),
                ),
                Icon(
                  Icons.light_mode,
                  color: Colors.yellow,
                  size: 50,
                ),
              ],
            ),
          ),
          buildPublishMessage(),
          buildPublishMessage2(),
          const SizedBox(height: 10),

         buildConnecteButtonFrom(currentAppState.getAppConnectionState),

        ],
      ),
    );
  }




  Widget buildSwitchWith(bool value ,MQTTAppConnectionState state) {


    return Switch(
        value: value9,
        onChanged: (val) {
          setState(() {
            value9 = val;
          });
          if(state == MQTTAppConnectionState.connected && value9 ==true)
            publishMessage(value9.toString());
          else if(state == MQTTAppConnectionState.connected && value9 != true)
            publishMessage(value9.toString());
        });
  }
  Widget buildSwitchWith2(bool value ,MQTTAppConnectionState state) {

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color( passtoggle ? 0xffdaa520 : 0xff023859
        ),
      ),
        onPressed: state == MQTTAppConnectionState.connected
            ? () {
          setState(() {
            value2 = !value2;
          });
          setState(() {
            passtoggle = !passtoggle;
          });
          if(state == MQTTAppConnectionState.connected && value2 ==true)
            publishMessage(value2.toString());
          else if(state == MQTTAppConnectionState.connected && value2 != true)
            publishMessage(value2.toString());
        } : null
      , child: Icon(Icons.ac_unit)
    );

  }

  Widget buildPublishMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: buildSwitchWith( false,
              currentAppState.getAppConnectionState),
        ),
        //_buildSendButtonFrom(currentAppState.getAppConnectionState)
      ],
    );
  }

  Widget buildPublishMessage2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: buildSwitchWith2( false,
              currentAppState.getAppConnectionState),
        ),
        //_buildSendButtonFrom(currentAppState.getAppConnectionState)
      ],
    );
  }

  Widget buildConnectionStateText(String status) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              color: Colors.deepOrangeAccent,
              child: Text(status, textAlign: TextAlign.center)),
        ),
      ],
    );
  }
  Widget buildScrollableTextWith(String text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 400,
        height: 200,
        child: SingleChildScrollView(
          child: Text(text),
        ),
      ),
    );
  }

  Widget buildConnecteButtonFrom(MQTTAppConnectionState state) {
    return Row(
      children: <Widget>[
        Expanded(
          // ignore: deprecated_member_use
          child: ElevatedButton(
            child: const Text('Connect'),
            onPressed: state == MQTTAppConnectionState.disconnected
                ? configureAndConnect
                : disconnect, //
          ),
        ),

      ],
    );
  }

  Widget buildSendButtonFrom(MQTTAppConnectionState state) {
    // ignore: deprecated_member_use
    return ElevatedButton(
      child: const Text('Send'),
      onPressed: state == MQTTAppConnectionState.connected
          ? () {
        publishMessage(value9.toString());
      }
          : null, //
    );
  }

  // Utility functions
  String prepareStateMessageFrom(MQTTAppConnectionState state) {
    switch (state) {
      case MQTTAppConnectionState.connected:
        return 'Connected';
      case MQTTAppConnectionState.connecting:
        return 'Connecting';
      case MQTTAppConnectionState.disconnected:
        return 'Disconnected';
    }
  }

  void configureAndConnect() {
    // ignore: flutter_style_todos
    // TODO: Use UUID
    String  osPrefix = 'Flutter_Android';

    if (Platform.isAndroid) {
      osPrefix = 'Flutter_iOS';
    }
    manager = MQTTManager(
        host: "91.121.93.94",
        topic: "ss",
        identifier: osPrefix,
        state: currentAppState);
    manager.initializeMQTTClient();
    manager.connect();
  }

  void disconnect() {
    manager.disconnect();
  }

  void publishMessage(String text) {
    String osPrefix = 'Flutter_Android';

    if (Platform.isAndroid) {
      osPrefix = 'Flutter_iOS';
    }
    final String message = osPrefix + ' says: ' + text;
    manager.publish(message);
  }
}
