import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

// Create an instance of the client
MqttServerClient client =
MqttServerClient.withPort('your.server.com', 'client-id', 1883);

// Connect to the broker
Future<void> connect() async {
  final connMessage = MqttConnectMessage()
      .withClientIdentifier('client-id')
      .keepAliveFor(60)
      .withWillTopic('will-topic')
      .withWillMessage('Client disconnected unexpectedly')
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);

  client.connectionMessage = connMessage;

  try {
    await client.connect();
  } catch (e) {
    print('Error connecting to broker: $e');
    client.disconnect();
  }
}

// Subscribe to a topic
void subscribe(String topic) {
  client.subscribe(topic, MqttQos.atMostOnce);
}
// Unsubscribe from a topic
void unsubscribe(String topic) {
  client.unsubscribe(topic);
}

// Handle incoming messages
void handleMessage(MqttReceivedMessage message) {
  final topic = message.topic;
  final payload = MqttPublishPayload.bytesToStringAsString(message.payload.message);

  print('Received message: $payload from topic: $topic');
}

// Listen for incoming messages
void listen() {
  client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> messages) {
    for (final message in messages) {
      handleMessage(message);
    }
  });
}

// Publish a message to a topic
void publish(String topic, String message) {
  final mqttMessage = MqttClientPayloadBuilder()
      .addString(message)
      .payload;

  client.publishMessage(topic, MqttQos.exactlyOnce, mqttMessage!);
}


// Disconnect from the broker
void disconnect() {
  client.disconnect();
}