// core lib
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// app models
import 'package:music_app/model/banner.model.dart';
import 'package:music_app/model/song.model.dart';
import 'package:music_app/model/topicon.model.dart';

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
  final tabTitleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
    color: Colors.black,
  );
  String? releaseType = 'all';
  final tags = <String>["Tất cả", "Việt Nam", "Quốc tế"];
  int _currentTab = 1;

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

  Widget buildChart(double h, double w) {
    return Container(
      margin: const EdgeInsets.all(12.5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 61, 27, 102),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: w * 0.9,
      height: h * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...buildTop5Song(top5Song),
          Center(
            child: Container(
              width: w * 0.2,
              height: h * 0.025,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 0.25, color: Colors.grey),
              ),
              child: const Center(
                child: Text(
                  "XEM THÊM",
                  style: TextStyle(color: Colors.white, fontSize: 12.5),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTopImage(BuildContext context, double h, double w) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 10.0),
      width: w * 0.9,
      height: h * 0.25,
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
                  height: h * 0.25,
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
      width: w * 0.9,
      height: h * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buildTopIconsRow(topIcons),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text("Khám phá", style: tabTitleStyle),
            elevation: 0,
            backgroundColor: Colors.white,
            expandedHeight: screenHeight * 0.05,
            actions: const [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.mic, color: Colors.black, size: 25.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(Icons.search, color: Colors.black, size: 25.0),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              buildTopImage(context, screenHeight, screenWidth),
              buildTopIcons(screenHeight, screenWidth),
              buildLatestListen(screenHeight, screenWidth),
              buildDiscovery(screenHeight, screenWidth),
              buildNewRelease(context, screenHeight, screenWidth),
              buildNotice(screenHeight, screenWidth),
              buildChart(screenHeight, screenWidth),
              buildPopular(screenHeight, screenWidth),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).highlightColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: btmIcons
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(e.iconData),
                label: e.title,
              ),
            )
            .toList(),
      ),
    );
  }
}
