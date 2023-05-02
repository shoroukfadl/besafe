import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import '../../../mqtt.dart';

Future<MqttClient> connect() async {

  MqttServerClient client=
  MqttServerClient.withPort('91.121.93.94', 'lens_4obHt5y9hPXoAF34XssJGXspAQ0', 1883);


  client.logging(on: true);
  client.onConnected = onConnected;
  client.onDisconnected = onDisconnected;
  // client.onUnsubscribed = onUnsubscribed;
  client.onSubscribed = onSubscribed;
  client.onSubscribeFail = onSubscribeFail;
  client.pongCallback = pong;
 // final builder = MqttClientPayloadBuilder();
// builder.addString(message);

// client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload);

  final connMess = MqttConnectMessage()
  // .withClientIdentifier("lens_nQEppogdT495DM5N5rMAD6w0IdD")
  //  .authenticateAs("nada", "nada")
    //  .keepAliveFor(60)
  //  .withWillTopic('test')
  //  .withWillMessage('My Will message')
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);
  client.connectionMessage = connMess;
  try {
    await client.connect();
    print('Connecting');
  } catch (e) {
    print('Exception: $e');
    client.disconnect();
  }

  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print('EMQX client connected');
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
      final payload =
      MqttPublishPayload.bytesToStringAsString(message.payload.message);

      print('Received message:$payload from topic: ${c[0].topic}>');
    });

    client.published!.listen((MqttPublishMessage message) {
      print('published');
      final payload =
      MqttPublishPayload.bytesToStringAsString(message.payload.message);
      print(
          'Published message: $payload to topic: ${message.variableHeader!.topicName}');
    });
  } else {
    print(
        'EMQX client connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect();
    exit(-1);
  }

  return client;
}

void onConnected() {
  print('Connected');
}

void onDisconnected() {
  print('Disconnected');
}

void onSubscribed(String topic) {
  print('Subscribed topic: $topic');
}

void onSubscribeFail(String topic) {
  print('Failed to subscribe topic: $topic');
}

void onUnsubscribed(String topic) {
  print('Unsubscribed topic: $topic');
}

void pong() {
  print('Ping response client callback invoked');
}
Future<MqttClient?> publish(MqttPublishMessage message) async
{
if (client!.connectionStatus!.state == MqttConnectionState.connected) {
print('EMQX client connected');

client!.published!.listen((message) {
print('published');
final payload =
MqttPublishPayload.bytesToStringAsString(message.payload.message);
print(
'Published message: $payload to topic: ${message.variableHeader!.topicName}');
});
} else {
print(
'EMQX client connection failed - disconnecting, status is ${client!.connectionStatus}');
client!.disconnect();
exit(-1);
}

return client;
}