// core lib
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// app models
import 'package:music_app/model/banner.model.dart';
import 'package:music_app/model/song.model.dart';

// customed widgets
import 'package:music_app/widgets/banner.card.dart';
import 'package:music_app/widgets/bigtext.dart';

// utils
import 'package:music_app/utils/converter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final bigTxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );
  String? releaseType = 'all';
  final tags = <String>["Tất cả", "Việt Nam", "Quốc tế"];

  Widget buildNotice(double scrH, double scrW) {
    return Container(
      width: scrW,
      height: scrH * 0.25,
      child: Column(
        children: [
          BigText(
            bigTxtStyle: bigTxtStyle,
            screenWidth: scrW,
            title: "Đáng chú ý",
            func: () {},
          ),
          Container(
            height: scrH * 0.2,
            child: ListView.builder(
              padding: const EdgeInsets.all(5.0),
              scrollDirection: Axis.horizontal,
              itemCount: discoverList.length,
              itemBuilder: (context, index) {
                BannerModel b = discoverList[index];
                return BannerCard(
                  bHeight: 120.0,
                  bWidth: 120.0,
                  banner: b,
                  fontSize: 12.5,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNewRelease(BuildContext context, double scrH, double scrW) {
    final typedSongs = releaseType == 'all'
        ? listOfSong
        : listOfSong.where((element) => element.type == releaseType).toList();

    return Container(
      width: scrW,
      child: Column(
        children: [
          BigText(
            bigTxtStyle: bigTxtStyle,
            screenWidth: scrW,
            title: "Mới phát hành",
            func: () {},
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              ...["all", "vietnam", "international"]
                  .map(
                    (e) => Container(
                      width: scrW * 0.2,
                      padding: const EdgeInsets.all(5.0),
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.grey, width: 0.25),
                          color: releaseType == e
                              ? Theme.of(context).highlightColor
                              : Colors.white),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            releaseType = e;
                          });
                        },
                        child: Center(
                          child: Text(
                            convertEngToVi(e),
                            style: TextStyle(
                              fontSize: 11.5,
                              color: releaseType == e
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
          Container(
            height: scrH * 0.375,
            child: ListView.builder(
              padding: const EdgeInsets.all(5.0),
              itemCount: (typedSongs.length / 4).round(),
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                var data = <Song>[];
                if (index * 4 + 4 <= typedSongs.length) {
                  for (var i = index * 4; i < index * 4 + 4; i++) {
                    data.add(typedSongs[i]);
                  }
                  return Container(
                    height: scrH * 0.375,
                    width: scrW * 0.85,
                    child: Column(children: buildSongCard(data)),
                  );
                } else {
                  for (var i = index * 4; i < typedSongs.length; i++) {
                    data.add(typedSongs[i]);
                  }
                  return Container(
                    height: scrH * 0.375,
                    width: scrW * 0.85,
                    child: Column(children: buildSongCard(data)),
                  );
                }
              }),
            ),
          ),
          // child: ListView(
          //   children: [
          //     ...typedSongs
          //         .map(
          //           (e) => ListTile(
          //             leading: Image.asset(
          //               e.imgUrl!,
          //               height: 50.0,
          //               width: 50.0,
          //               fit: BoxFit.cover,
          //             ),
          //             title: Text(e.songName!),
          //             subtitle: Text(e.singerName!),
          //             trailing: GestureDetector(
          //               onTap: () {},
          //               child: Icon(Icons.more_vert_outlined),
          //             ),
          //           ),
          //         )
          //         .toList()
          //   ],
          // ),
          // ),
        ],
      ),
    );
  }

  Widget buildDiscovery(double scrH, double scrW) {
    return Container(
      width: scrW,
      child: Column(
        children: [
          BigText(
            bigTxtStyle: bigTxtStyle,
            screenWidth: scrW,
            title: "Khám phá",
            func: () {},
          ),
          Container(
            height: scrH * 0.2,
            child: ListView.builder(
              padding: const EdgeInsets.all(5.0),
              scrollDirection: Axis.horizontal,
              itemCount: discoverList.length,
              itemBuilder: (context, index) {
                BannerModel b = discoverList[index];
                return BannerCard(
                  bHeight: 120.0,
                  bWidth: 120.0,
                  banner: b,
                  fontSize: 12.5,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLatestListen(double scrH, double scrW) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      width: scrW,
      height: scrH * 0.23,
      child: Column(
        children: [
          BigText(
            bigTxtStyle: bigTxtStyle,
            screenWidth: scrW,
            title: "Nghe gần đây",
            func: () {},
          ),
          Container(
            height: scrH * 0.18,
            child: ListView.builder(
              padding: const EdgeInsets.all(5.0),
              scrollDirection: Axis.horizontal,
              itemCount: latestListenSongs.length,
              itemBuilder: (context, index) {
                BannerModel bn = latestListenSongs[index];
                return BannerCard(
                  bHeight: 100.0,
                  bWidth: 100.0,
                  banner: bn,
                  fontSize: 11.25,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).highlightColor),
      body: SafeArea(
        child: ListView(
          children: [
            buildLatestListen(screenHeight, screenWidth),
            buildDiscovery(screenHeight, screenWidth),
            buildNewRelease(context, screenHeight, screenWidth),
            buildNotice(screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }
}
