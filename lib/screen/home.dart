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
      child: Column(
        children: [
          BigText(
            bigTxtStyle: bigTxtStyle,
            screenWidth: scrW,
            title: "Đáng chú ý",
            func: () {},
          ),
          Container(
            height: scrH * 0.24,
            child: ListView.builder(
              padding: const EdgeInsets.all(5.0),
              scrollDirection: Axis.horizontal,
              itemCount: noticeList.length,
              itemBuilder: (context, index) {
                BannerModel b = noticeList[index];
                return BannerCard(
                  bHeight: 145.0,
                  bWidth: 145.0,
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
            height: scrH * 0.36,
            child: CarouselSlider.builder(
              itemCount: (typedSongs.length / 4).round(),
              itemBuilder: ((context, index, realId) {
                var data = <Song>[];
                if (index * 4 + 4 <= typedSongs.length) {
                  for (var i = index * 4; i < index * 4 + 4; i++) {
                    data.add(typedSongs[i]);
                  }
                  return Container(
                    height: scrH * 0.36,
                    width: scrW * 0.92,
                    child: Column(children: buildSongCard(data)),
                  );
                } else {
                  for (var i = index * 4; i < typedSongs.length; i++) {
                    data.add(typedSongs[i]);
                  }
                  return Container(
                    height: scrH * 0.36,
                    width: scrW * 0.92,
                    child: Column(children: buildSongCard(data)),
                  );
                }
              }),
              options: CarouselOptions(
                aspectRatio: 1.2,
                autoPlay: false,
                viewportFraction: 1.5,
                enableInfiniteScroll: false,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPopular(double scrH, double scrW) {
    return Container(
      width: scrW,
      child: Column(
        children: [
          BigText(
            bigTxtStyle: bigTxtStyle,
            screenWidth: scrW,
            title: "Thịnh hành",
            func: () {},
          ),
          Container(
            height: scrH * 0.25,
            child: ListView.builder(
              padding: const EdgeInsets.all(5.0),
              scrollDirection: Axis.horizontal,
              itemCount: popularSongs.length,
              itemBuilder: (context, index) {
                BannerModel b = popularSongs[index];
                return BannerCard(
                  bHeight: 145.0,
                  bWidth: 145.0,
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
            height: scrH * 0.24,
            child: ListView.builder(
              padding: const EdgeInsets.all(5.0),
              scrollDirection: Axis.horizontal,
              itemCount: discoverList.length,
              itemBuilder: (context, index) {
                BannerModel b = discoverList[index];
                return BannerCard(
                  bHeight: 145.0,
                  bWidth: 145.0,
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
      child: Column(
        children: [
          BigText(
            bigTxtStyle: bigTxtStyle,
            screenWidth: scrW,
            title: "Nghe gần đây",
            func: () {},
          ),
          Container(
            height: scrH * 0.2,
            child: ListView.builder(
              padding: const EdgeInsets.all(5.0),
              scrollDirection: Axis.horizontal,
              itemCount: latestListenSongs.length,
              itemBuilder: (context, index) {
                BannerModel bn = latestListenSongs[index];
                return BannerCard(
                  bHeight: 115.0,
                  bWidth: 115.0,
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

  Widget buildChart(double h, double w) {
    return Container(
      margin: const EdgeInsets.all(12.5),
      decoration: BoxDecoration(
        color: Colors.purple[900],
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: w * 0.9,
      height: h * 0.65,
    );
  }

  Widget buildTopImage(BuildContext context, double h, double w) {
    return Container(
      margin: const EdgeInsets.all(12.5),
      width: w * 0.9,
      height: h * 0.24,
      child: CarouselSlider.builder(
        itemCount: imgSongs.length,
        itemBuilder: ((context, index, realIndex) {
          var imgUrl = imgSongs[index];
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.cover,
                  width: w * 0.9,
                  height: h * 0.24,
                ),
              ),
              Positioned(
                right: 10.0,
                top: 10.0,
                child: Row(children: buildDots(index, imgSongs.length)),
              ),
            ],
          );
        }),
        options: CarouselOptions(
          aspectRatio: 1,
          enlargeCenterPage: false,
          autoPlay: true,
          viewportFraction: 1,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }

  Widget buildTopIcons(double h, double w) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.5),
      decoration: BoxDecoration(
        color: Colors.amber[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: w * 0.9,
      height: h * 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: ListView(
          children: [
            buildTopImage(context, screenHeight, screenWidth),
            buildTopIcons(screenHeight, screenWidth),
            buildLatestListen(screenHeight, screenWidth),
            buildDiscovery(screenHeight, screenWidth),
            buildNewRelease(context, screenHeight, screenWidth),
            buildNotice(screenHeight, screenWidth),
            buildChart(screenHeight, screenWidth),
            buildPopular(screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }
}
