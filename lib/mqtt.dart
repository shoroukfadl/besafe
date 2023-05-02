import 'package:mqtt_client/mqtt_client.dart';

MqttClient? client;
var topic = "MM";
void _publish(String message) {
  final builder = MqttClientPayloadBuilder();
  builder.addString('hi $message');
  client?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
}