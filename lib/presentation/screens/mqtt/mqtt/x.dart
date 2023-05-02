import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mqtt/MQTTManager.dart';
import '../mqtt/state/MQTTAppState.dart';


class MQTTView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MQTTViewState();
  }
}

class _MQTTViewState extends State<MQTTView> {
  final TextEditingController _hostTextController = TextEditingController();
  final TextEditingController _messageTextController = TextEditingController();
  final TextEditingController _topicTextController = TextEditingController();
  late MQTTAppState currentAppState;
  late MQTTManager manager;
  bool value9= false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _hostTextController.dispose();
    _messageTextController.dispose();
    _topicTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    // Keep a reference to the app state.
    currentAppState = appState;
    return Scaffold(
        appBar: AppBar(
          title: const Text('MQTT'),
          backgroundColor: Colors.greenAccent,
        ),
        body: buildColumn());
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('MQTT'),
      backgroundColor: Colors.greenAccent,
    );
  }

  Widget buildColumn() {
    return Column(
      children: <Widget>[
        buildConnectionStateText(
            prepareStateMessageFrom(currentAppState.getAppConnectionState)),
        buildEditableColumn(),
        buildScrollableTextWith(currentAppState.getHistoryText)
      ],
    );
  }

  Widget buildEditableColumn() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          // _buildTextFieldWith(_hostTextController, 'Enter broker address',
          //     currentAppState.getAppConnectionState),
          // const SizedBox(height: 10),
          // _buildTextFieldWith(
          //     _topicTextController,
          //     'Enter a topic to subscribe or listen',
          //     currentAppState.getAppConnectionState),
          const SizedBox(height: 10),
          buildPublishMessage(),
          const SizedBox(height: 10),
          buildConnecteButtonFrom(currentAppState.getAppConnectionState)
        ],
      ),
    );
  }

  Widget buildPublishMessageRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: buildTextFieldWith(_messageTextController, 'Enter a message',
              currentAppState.getAppConnectionState),
        ),
        buildSendButtonFrom(currentAppState.getAppConnectionState)
      ],
    );
  }


  Widget buildSwitchWith(bool value ,MQTTAppConnectionState state) {
    bool shouldEnable = false;

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

  void s(MQTTAppConnectionState state)
  {
    state == MQTTAppConnectionState.connected
        ? () {
      publishMessage(value9.toString());
    }
        : null;
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

  Widget buildTextFieldWith(TextEditingController controller, String hintText,
      MQTTAppConnectionState state) {
    bool shouldEnable = false;
    if (controller == _messageTextController &&
        state == MQTTAppConnectionState.connected) {
      shouldEnable = true;
    } else if ((controller == _hostTextController &&
        state == MQTTAppConnectionState.disconnected) ||
        (controller == _topicTextController &&
            state == MQTTAppConnectionState.disconnected)) {
      shouldEnable = true;
    }
    return TextField(
        enabled: shouldEnable,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
          labelText: hintText,
        ));
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
                : null, //
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          // ignore: deprecated_member_use
          child: ElevatedButton(
            child: const Text('Disconnect'),
            onPressed: state == MQTTAppConnectionState.connected
                ? disconnect
                : null, //
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
    _messageTextController.clear();
  }
}
