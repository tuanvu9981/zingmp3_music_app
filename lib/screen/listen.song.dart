import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/model/song.model.dart';
import 'package:music_app/widgets/info.banner.dart';
import 'package:music_app/widgets/info.line.dart';
import 'package:music_app/widgets/playing.btmbar.dart';
import 'package:music_app/widgets/spinner.dart';

class ListenSongScreen extends StatefulWidget {
  const ListenSongScreen({super.key});

  @override
  ListenSongScreenState createState() => ListenSongScreenState();
}

class ListenSongScreenState extends State<ListenSongScreen>
    with TickerProviderStateMixin {
  int maxDuration = 100;
  int currentPosition = 0;
  String currentPlayingTime = "00:00";
  String audioUrl = 'audios/ben_tren_tang_lau_tang_duy_tan.mp3';
  bool isPlaying = false;
  bool hasStarted = false;
  late Uint8List audiobytes;
  var player = AudioPlayer();

  final _gradientColor = const LinearGradient(
    colors: [
      Color.fromARGB(255, 129, 121, 121),
      Color.fromARGB(255, 158, 158, 158),
      Colors.grey,
    ],
  );
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    // 1. initialize for tab controller
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });

    Future.delayed(Duration.zero, () async {
      ByteData bytes = await rootBundle.load(
        "assets/$audioUrl",
      ); //load audio from assets
      audiobytes = bytes.buffer.asUint8List(
        bytes.offsetInBytes,
        bytes.lengthInBytes,
      );

      player.onDurationChanged.listen((Duration d) {
        maxDuration = d.inMilliseconds;
        setState(() {});
      });

      player.onPositionChanged.listen((Duration p) {
        currentPosition = p.inMilliseconds;

        int shours = Duration(milliseconds: currentPosition).inHours;
        int sminutes = Duration(milliseconds: currentPosition).inMinutes;
        int sseconds = Duration(milliseconds: currentPosition).inSeconds;

        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        String newMinutes = rminutes < 10 ? "0:$rminutes" : "$rminutes";
        String newSeconds = rseconds < 10 ? "0:$rseconds" : "$rseconds";

        currentPlayingTime = "$newMinutes:$newSeconds";

        setState(() {
          //refresh the UI
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String getTitleByTabId(int tabId) {
    if (tabId == 0) {
      return 'Thông tin';
    } else if (tabId == 1) {
      return 'Bên trên tầng lầu';
    } else {
      return 'Lời bài hát';
    }
  }

  Widget _buildSongInfoTab(double screenWidth) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 12.5,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 182, 174, 174),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                BannerInfo(
                  imageUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
                  song: 'Bên trên tầng lầu',
                  singer: 'Tăng Duy Tân',
                ),
                const Divider(height: 20, thickness: 0.5, color: Colors.white),
                InfoLine(title: 'Album', content: 'Vì sao em phải khóc'),
                InfoLine(title: 'Nhạc sĩ', content: 'Tăng Duy Tân'),
                InfoLine(title: 'Thể loại', content: 'Việt Nam, VPop'),
                InfoLine(title: 'Phát hành', content: '18/07/2023'),
                InfoLine(title: 'Cung cấp', content: 'ST.319'),
              ],
            ),
          ),
          const SizedBox(height: 25.0),
          Container(
            width: double.infinity,
            child: const Text(
              'Có thể bạn muốn nghe',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          ...buildTopSong(top8Song, 0),
        ],
      ),
    );
  }

  Widget _buildPlayingSongTab(double screenHeight) {
    return Container(
      height: screenHeight,
      width: double.infinity,
      child: Column(
        children: [
          Spinner(
            imageUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
            song: 'Bên trên tầng lầu',
            singer: 'Tăng Duy Tân',
            isPlaying: isPlaying,
          ),
        ],
      ),
    );
  }

  Widget _buildSongLyricTab() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Dismissible(
      direction: DismissDirection.down,
      key: const Key('listen'),
      onDismissed: (DismissDirection direction) {
        Navigator.pop(context);
      },
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: _gradientColor),
            ),
            title: Text(
              getTitleByTabId(_selectedIndex),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            centerTitle: true,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            actions: const [
              Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 30.0,
              )
            ],
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 22.5,
              ),
              decoration: BoxDecoration(gradient: _gradientColor),
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildSongInfoTab(screenWidth),
                  _buildPlayingSongTab(screenHeight),
                  _buildSongLyricTab(),
                ],
              ),
            ),
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            height: _selectedIndex == 1 ? 230.0 : 125.0,
            decoration: BoxDecoration(gradient: _gradientColor),
            child: Column(
              children: [
                Expanded(
                  flex: _selectedIndex == 1 ? 1 : 3,
                  child: Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.white54,
                    thumbColor: Colors.white,
                    value: double.parse(currentPosition.toString()),
                    min: 0,
                    max: double.parse(maxDuration.toString()),
                    divisions: maxDuration,
                    label: currentPlayingTime,
                    onChanged: (double value) async {
                      int seekVal = value.round();
                      await player.seek(Duration(milliseconds: seekVal));
                      setState(() {
                        currentPosition = seekVal;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.loop_outlined,
                        size: 35.0,
                        color: Colors.white70,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (!isPlaying && !hasStarted) {
                            await player.play(AssetSource(audioUrl));
                            setState(() {
                              isPlaying = true;
                              hasStarted = true;
                            });
                          } else if (!isPlaying && hasStarted) {
                            await player.resume();
                            setState(() {
                              isPlaying = true;
                              hasStarted = true;
                            });
                          } else {
                            await player.pause();
                            setState(() {
                              isPlaying = false;
                            });
                          }
                        },
                        child: Icon(
                          isPlaying == false
                              ? Icons.play_circle_outline_rounded
                              : Icons.pause_circle_outline_rounded,
                          color: Colors.white,
                          size: 60.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                      const Icon(
                        Icons.loop_outlined,
                        size: 35.0,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _selectedIndex == 1
                      ? PlayingBtmBar()
                      : SizedBox(width: 0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
