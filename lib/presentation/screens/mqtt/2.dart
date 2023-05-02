import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';

import '1.dart';

class Test extends StatelessWidget {
 // const Test({Key? key}) : super(key: key);
  MqttClient? client;
  var topic = "yomna";
  void _publish(String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString('hi $message');
    client?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Connect'),
              onPressed: () {
                connect().then((value) {
                  client = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Subscribe'),
              onPressed: ()   {
                client?.subscribe(topic, MqttQos.atLeastOnce);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Publish'),
              onPressed: ()   {
                client!.subscribe("shorouk", MqttQos.atLeastOnce);
              _publish('Nada');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Unsubscribe'),
              onPressed: ()   {
                client?.unsubscribe(topic);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Disconnect'),
              onPressed: ()   {
                client?.disconnect();
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
