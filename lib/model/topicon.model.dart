import 'package:flutter/material.dart';

class TopIcon {
  IconData iconData;
  Color? bgColor;
  String title;

  TopIcon({required this.iconData, this.bgColor, required this.title});
}

var topIcons = <TopIcon>[
  TopIcon(
    iconData: Icons.library_music_outlined,
    bgColor: Colors.lightBlue,
    title: "Nhạc mới",
  ),
  TopIcon(
    iconData: Icons.shape_line_outlined,
    bgColor: Colors.orangeAccent,
    title: "Thể loại",
  ),
  TopIcon(
    iconData: Icons.star,
    bgColor: const Color.fromARGB(255, 145, 68, 158),
    title: "Top 100",
  ),
  TopIcon(
    iconData: Icons.podcasts,
    bgColor: const Color.fromARGB(255, 84, 194, 93),
    title: "Podcast",
  ),
  TopIcon(
    iconData: Icons.videocam_rounded,
    bgColor: const Color.fromARGB(255, 5, 116, 206),
    title: "Top MV",
  ),
];

List<Widget> buildTopIconsRow(List<TopIcon> icons) {
  return icons
      .map(
        (e) => Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: e.bgColor,
                  borderRadius: BorderRadius.circular(12.5),
                ),
                child: Icon(e.iconData, color: Colors.white, size: 35.0),
              ),
              Text(e.title, style: TextStyle(fontSize: 12.0))
            ],
          ),
        ),
      )
      .toList();
}

var btmIcons = <TopIcon>[
  TopIcon(
    iconData: Icons.library_music_outlined,
    title: "Thư viện",
  ),
  TopIcon(
    iconData: Icons.ads_click_rounded,
    title: "Khám phá",
  ),
  TopIcon(
    iconData: Icons.add_chart_outlined,
    title: "Zing chart",
  ),
  TopIcon(
    iconData: Icons.podcasts,
    title: "Radio",
  ),
  TopIcon(
    iconData: Icons.account_circle_outlined,
    title: "Cá nhân",
  ),
];
