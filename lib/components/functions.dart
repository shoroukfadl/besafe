import 'dart:io';

import 'package:besafe/presentation/screens/mqtt/mqtt/MQTTManager.dart';
import 'package:besafe/presentation/screens/mqtt/mqtt/state/MQTTAppState.dart';

abstract  class MQTTConnection{

  static MQTTAppState? currentAppState;
  static MQTTManager? manager;
  static void configureAndConnect() {
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
        state: currentAppState!);
    manager!.initializeMQTTClient();
    manager!.connect();
  }
 static void buildConnect(MQTTAppConnectionState state) {
    state == MQTTAppConnectionState.disconnected
        ? configureAndConnect : null;
  }

}