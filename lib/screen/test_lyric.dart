import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lyric/lyrics_reader.dart';
import 'package:music_app/lyrics/lyrics.dart';

class TestLyric extends StatefulWidget {
  const TestLyric({super.key});

  @override
  TestLyricState createState() => TestLyricState();
}

class TestLyricState extends State<TestLyric>
    with SingleTickerProviderStateMixin {
  AudioPlayer? audioPlayer;
  double sliderProgress = 111658;
  int playProgress = 111658;
  double max_value = 211658;
  bool isTap = false;
  bool useEnhancedLrc = false;

  var lyricModel =
      LyricsModelBuilder.create().bindLyricToMain(normalLyrics).getModel();

  var lyricUI = UINetease();
  var lyricPadding = 40.0;
  var playing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildReaderWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...buildPlayControl(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildReaderWidget() {
    return LyricsReader(
      padding: EdgeInsets.symmetric(horizontal: lyricPadding),
      model: lyricModel,
      position: playProgress,
      lyricUi: lyricUI,
      playing: playing,
      size: Size(double.infinity, MediaQuery.of(context).size.height / 2),
      emptyBuilder: () => Center(
        child: Text(
          "No lyrics",
          style: lyricUI.getOtherMainTextStyle(),
        ),
      ),
      selectLineBuilder: (progress, confirm) {
        return Row(
          children: [
            IconButton(
                onPressed: () {
                  LyricsLog.logD("点击事件");
                  confirm.call();
                  setState(() {
                    audioPlayer?.seek(Duration(milliseconds: progress));
                  });
                },
                icon: Icon(Icons.play_arrow, color: Colors.green)),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.green),
                height: 1,
                width: double.infinity,
              ),
            ),
            Text(
              progress.toString(),
              style: TextStyle(color: Colors.green),
            )
          ],
        );
      },
    );
  }

  List<Widget> buildPlayControl() {
    return [
      Container(height: 20),
      Text(
        "Progress:$sliderProgress",
        style: const TextStyle(fontSize: 16, color: Colors.green),
      ),
      if (sliderProgress < max_value)
        Slider(
          min: 0,
          max: max_value,
          label: sliderProgress.toString(),
          value: sliderProgress,
          activeColor: Colors.blueGrey,
          inactiveColor: Colors.blue,
          onChanged: (double value) {
            setState(() {
              sliderProgress = value;
            });
          },
          onChangeStart: (double value) {
            isTap = true;
          },
          onChangeEnd: (double value) {
            isTap = false;
            setState(() {
              playProgress = value.toInt();
            });
            audioPlayer?.seek(Duration(milliseconds: value.toInt()));
          },
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () async {
                if (audioPlayer == null) {
                  audioPlayer = AudioPlayer()
                    ..play(
                      AssetSource("audios/ben_tren_tang_lau_tang_duy_tan.mp3"),
                    );
                  setState(() {
                    playing = true;
                  });
                  audioPlayer?.onDurationChanged.listen((Duration event) {
                    setState(() {
                      max_value = event.inMilliseconds.toDouble();
                    });
                  });
                  audioPlayer?.onPositionChanged.listen((Duration event) {
                    if (isTap) return;
                    setState(() {
                      sliderProgress = event.inMilliseconds.toDouble();
                      playProgress = event.inMilliseconds;
                    });
                  });

                  audioPlayer?.onPlayerStateChanged.listen((PlayerState state) {
                    setState(() {
                      playing = state == PlayerState.playing;
                    });
                  });
                } else {
                  audioPlayer?.resume();
                }
              },
              child: Text("Play")),
          Container(width: 10),
          TextButton(
            onPressed: () async {
              audioPlayer?.pause();
            },
            child: Text("Pause"),
          ),
          Container(width: 10),
          TextButton(
            onPressed: () async {
              audioPlayer?.stop();
              audioPlayer = null;
            },
            child: Text("Stop"),
          ),
        ],
      ),
    ];
  }
}
