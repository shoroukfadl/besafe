import 'dart:io' show Platform;
import 'package:besafe/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mqtt/mqtt/MQTTManager.dart';
import 'mqtt/mqtt/state/MQTTAppState.dart';



class MQTTView4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState(

      ) {
    return _MQTTView4State();
  }
}

class _MQTTView4State extends State<MQTTView4> {
  bool passtoggle1 = false;
  bool passtoggle2 = false;
  bool passtoggle3 = false;
  bool passtoggle4 = false;

  bool ispressed =false;
  late MQTTAppState currentAppState;
  late MQTTManager manager;
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
        const SizedBox(height: 20,),
        buildEditableColumn(),
      ],
    );
  }

  Widget buildEditableColumn() {
    return   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text(
                  'Control Your Living Room',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.indigo
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 60,
                    height: 60,
                    child: buildConnecteButton(currentAppState.getAppConnectionState)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              height: 105,
              width: 360,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Current Temperature',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: const [
                        Text(
                          '0\u00B0',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildElevatedButton1with(currentAppState.getAppConnectionState),
              buildElevatedButton2with(currentAppState.getAppConnectionState),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildElevatedButton3with(currentAppState.getAppConnectionState),
              buildElevatedButton4with(currentAppState.getAppConnectionState),
            ],
          ),
        ],
      ),
    );
  }

  /* light button   */
  Widget buildElevatedButton1with(MQTTAppConnectionState state) {
    return Container(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
          width: 155,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Light',
                style:
                TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Icon(
                Icons.light_mode,
                color: Colors.yellow,
                size: 35,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color( passtoggle1 ? 0xffdaa520 : 0xff023859,
                ),
                fixedSize: const Size(140, 40),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value1 = !SwitchValues.value1;
                });
                setState(() {
                  passtoggle1 = !passtoggle1;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value1 ==true)
                  publishMessage("LIGHT living ON");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value1 == false)
                  publishMessage("LIGHT living OFF");
              } : null
              , child: passtoggle1? const Text("ON") : const Text("OFF")
          ),
        ],
      ),
    );

  }
  /* AC button   */
  Widget buildElevatedButton2with(MQTTAppConnectionState state) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
      width: 155,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'AC',
                style:
                TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Icon(
                Icons.ac_unit,
                color: Colors.yellow,
                size: 35,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color( passtoggle2 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value2 = !SwitchValues.value2;
                });
                setState(() {
                  passtoggle2 = !passtoggle2;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value2 ==true)
                  publishMessage("AC living ON");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value2 == false)
                  publishMessage("AC living OFF");
              } : null
              , child: passtoggle2? const Text("ON") : const Text("OFF")
          ),
        ],
      ),
    );
  }

  /* TV button   */
  Widget buildElevatedButton3with(MQTTAppConnectionState state) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
      width: 155,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'TV',
                style:
                TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Icon(
                Icons.tv,
                color: Colors.yellow,
                size: 35,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color( passtoggle3 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value3 = !SwitchValues.value3;
                });
                setState(() {
                  passtoggle3 = !passtoggle3;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value3 ==true)
                  publishMessage("TV living ON");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value3 == false)
                  publishMessage("TV living OFF");
              } : null
              , child: passtoggle3? const Text("ON") : const Text("OFF")
          ),
        ],
      ),
    );
  }

  /* Door button   */
  Widget buildElevatedButton4with(MQTTAppConnectionState state) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
      width: 155,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'DOOR',
                style:
                TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Icon(
                Icons.door_sliding_outlined,
                color: Colors.yellow,
                size: 35,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color( passtoggle4 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value4 = !SwitchValues.value4;
                });
                setState(() {
                  passtoggle4 = !passtoggle4;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value4 ==true)
                  publishMessage("DOOR opend");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value4 == false)
                  publishMessage("DOOR Closed");
              } : null
              , child: passtoggle4? const Text("OPEND") : const Text("CLOSED")
          ),
        ],
      ),
    );

  }

 /*  build connection */
  Widget buildConnecteButton(MQTTAppConnectionState state) {
    return Row(
      children: <Widget>[
        Expanded(
          // ignore: deprecated_member_use
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color( 0xff023859,
                  ),
                  fixedSize: const Size(40, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
            child: Icon(Icons.power_settings_new , color : ispressed ? Colors.purple:  Colors.white),
              onPressed: state == MQTTAppConnectionState.disconnected
              ? () {
                setState(() {
                  ispressed = !ispressed;
                });
            configureAndConnect();
              } : () {
                setState(() {
                  ispressed = !ispressed;
                });
                disconnect();
              }

    ),
    ),

    ],
    );
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

  /* publish message */
  void publishMessage(String text) {
    String osPrefix = 'Flutter_Android';

    if (Platform.isAndroid) {
      osPrefix = 'Flutter_iOS';
    }
    final String message = osPrefix + ' says: ' + text;
    manager.publish(message);
  }
}
