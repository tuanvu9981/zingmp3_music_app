import 'package:flutter/material.dart';

class PlayingBtmBar extends StatelessWidget {
  const PlayingBtmBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.comment, color: Colors.white70, size: 25.0),
          Icon(
            Icons.music_note_outlined,
            color: Colors.white70,
            size: 25.0,
          ),
          Icon(
            Icons.download_for_offline_outlined,
            color: Colors.white70,
            size: 25.0,
          ),
          Icon(
            Icons.queue_music_outlined,
            color: Colors.white70,
            size: 25.0,
          ),
        ],
      ),
    );
  }
}
