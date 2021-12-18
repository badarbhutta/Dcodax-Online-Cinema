import 'package:online_cinema/utils/agora.dart';
import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

class AgoraUIScreen extends StatefulWidget {
  const AgoraUIScreen({Key? key}) : super(key: key);

  @override
  _AgoraUIScreenState createState() => _AgoraUIScreenState();
}

class _AgoraUIScreenState extends State<AgoraUIScreen> {
  // Instantiate the client
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: APP_ID,
      channelName: "demo",
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );

// Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: client, showNumberOfUsers: true),
            AgoraVideoViewer(client: client, showNumberOfUsers: true),
          ],
        ),
      ),
    );
  }
}
