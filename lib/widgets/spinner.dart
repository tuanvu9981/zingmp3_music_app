import 'package:flutter/material.dart';
import 'dart:math' as math;

class Spinner extends StatefulWidget {
  final String imageUrl;
  final String song;
  final String singer;
  bool isPlaying;

  Spinner({
    super.key,
    required this.imageUrl,
    required this.song,
    required this.singer,
    required this.isPlaying,
  });
  @override
  SpinnerState createState() => SpinnerState();
}

class SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: widget.isPlaying == true
                    ? _controller.value * math.pi * 2
                    : 0,
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.imageUrl),
                  radius: 160.0,
                ),
              );
            },
          ),
          const SizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.share, color: Colors.white),
              Column(
                children: [
                  Text(
                    widget.song,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    widget.singer,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              Icon(Icons.favorite_border_outlined, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
