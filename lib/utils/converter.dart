import 'package:flutter/material.dart';
import 'package:music_app/model/song.model.dart';

String convertEngToVi(String eng) {
  if (eng == 'all') {
    return "Tất cả";
  }
  if (eng == 'vietnam') {
    return "Việt Nam";
  } else {
    return "Quốc tế";
  }
}

List<Widget> buildSongCard(List<Song> songs) {
  return songs
      .map((e) => ListTile(
            leading: Image.asset(
              e.imgUrl!,
              height: 60.0,
              width: 60.0,
              fit: BoxFit.cover,
            ),
            title: Text(e.songName!),
            subtitle: Text(e.singerName!),
            trailing: GestureDetector(
              onTap: () {},
              child: Icon(Icons.more_vert_outlined),
            ),
          ))
      .toList();
}

List<Widget> buildDots(int index, int length) {
  List<Widget> icons = [];
  for (var i = 0; i < length; i++) {
    icons.add(Icon(
      Icons.circle,
      size: 10.0,
      color: i == index ? Colors.white : Colors.grey,
    ));
    icons.add(const SizedBox(width: 2.0));
  }
  return icons;
}
