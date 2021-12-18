import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StreamPlayer extends StatefulWidget {
  final String? videoUrl;
  StreamPlayer(
      {@required this.videoUrl});
  @override
  _StreamPlayerState createState() => _StreamPlayerState();
}

class _StreamPlayerState extends State<StreamPlayer> {
  BetterPlayerController? _controller;

  @override
  void initState() {
    playerConfig();
    super.initState();
  }

  playerConfig() {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, widget.videoUrl!,
        liveStream: true);
    _controller = BetterPlayerController(
        BetterPlayerConfiguration(
          looping: false,
          aspectRatio: 16 / 9,
          autoDetectFullscreenDeviceOrientation: true,
          autoPlay: true,
        ),
        betterPlayerDataSource: betterPlayerDataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(widget.videoUrl!,
                    style: GoogleFonts.teko(
                      color: Theme.of(context).primaryColor == Colors.blue
                          ? Colors.black54
                          : Colors.grey[50],
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    )),),
      body: Column(
        children: [
          BetterPlayer(
            controller: _controller!,
          ),
        ],
      ),
    );
  }
}