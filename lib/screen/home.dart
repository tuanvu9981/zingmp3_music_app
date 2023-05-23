import 'package:flutter/material.dart';
import 'package:music_app/model/banner.model.dart';
import 'package:music_app/widgets/banner.card.dart';
import 'package:music_app/widgets/bigtext.dart';

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

  Widget buildNewRelease(double scrH, double scrW) {
    return Container(
        width: scrW,
        height: scrH * 0.25,
        child: Column(
          children: [
            BigText(
              bigTxtStyle: bigTxtStyle,
              screenWidth: scrW,
              title: "Mới phát hành",
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
        ));
  }

  Widget buildDiscovery(double scrH, double scrW) {
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
              itemCount: discoverList.length,
              itemBuilder: (context, index) {
                BannerModel bn = discoverList[index];
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
            buildDiscovery(screenHeight, screenWidth),
            buildNewRelease(screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }
}
