import 'package:flutter/material.dart';

class Song {
  String? singerName;
  String? songName;
  String? imgUrl;
  String? type;
  int? listenTimes;

  Song({
    this.singerName,
    this.songName,
    this.imgUrl,
    this.type,
    this.listenTimes,
  });
}

var listOfSong = <Song>[
  Song(
    imgUrl: 'assets/images/songs/ba_ke_con_nghe.jpg',
    singerName: 'Nguyễn Hải Phong',
    songName: 'Ba kể con nghe',
    type: 'vietnam',
  ),
  Song(
    imgUrl: 'assets/images/songs/look_what_you_mmdo.jpg',
    singerName: 'Taylor Swift',
    songName: 'Look what you made me do',
    type: 'international',
  ),
  Song(
    imgUrl: 'assets/images/songs/tabun_yoasobi.jpg',
    singerName: 'Yoasobi',
    songName: 'Tabun',
    type: 'international',
  ),
  Song(
    imgUrl: 'assets/images/songs/yoruni_kakeru.jpg',
    singerName: 'Yoasobi',
    songName: 'Yoruni kakeru',
    type: 'international',
  ),
  Song(
    imgUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
    singerName: 'Tăng Duy Tân',
    songName: 'Bên trên tầng lầu',
    type: 'vietnam',
  ),
  Song(
    imgUrl: 'assets/images/songs/cay_vi_cam.jpg',
    singerName: 'Thùy Chi',
    songName: 'Cây vĩ cầm',
    type: 'vietnam',
  ),
  Song(
    imgUrl: 'assets/images/songs/dong_thoi_gian.jpg',
    singerName: 'Nguyễn Hải Phong',
    songName: 'Dòng thời gian',
    type: 'vietnam',
  ),
  Song(
    imgUrl: 'assets/images/songs/kenshi-yonezu-lemon.jpg',
    singerName: 'Kenshi Yonezu',
    songName: 'Lemon',
    type: 'international',
  ),
  Song(
    imgUrl: 'assets/images/songs/love_your_self.jpg',
    singerName: 'Justin Bieber',
    songName: 'Love yourself',
    type: 'international',
  ),
  Song(
    imgUrl: 'assets/images/songs/overdose.jpeg',
    singerName: 'EXO',
    songName: 'Overdose',
    type: 'international',
  ),
  Song(
    imgUrl: 'assets/images/songs/thanh_thi.jpg',
    singerName: 'Thùy Chi',
    songName: 'Thành thị',
    type: 'vietnam',
  ),
  Song(
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    type: 'vietnam',
  ),
  Song(
    imgUrl: 'assets/images/songs/the-night-avichi.jpeg',
    singerName: 'Avichi',
    songName: 'The night',
    type: 'international',
  ),
  Song(
    imgUrl: 'assets/images/tay_bac.jpg',
    singerName: 'Đoàn Thúy Trang',
    songName: 'Tình yêu màu nắng',
    type: 'vietnam',
  ),
];

var imgSongs = <String>[
  'assets/images/songs/topImg1.jpg',
  'assets/images/songs/topImg2.jpg',
  'assets/images/songs/topImg3.jpg',
  'assets/images/songs/topImg4.jpg',
  'assets/images/songs/topImg5.jpg',
];

var top5Song = <Song>[
  Song(
    imgUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
    singerName: 'Tăng Duy Tân',
    songName: 'Bên trên tầng lầu',
    listenTimes: 18273,
  ),
  Song(
    imgUrl: 'assets/images/songs/denvau.jpg',
    singerName: 'Đen Vâu',
    songName: 'Nấu cơm cho em',
    listenTimes: 20184,
  ),
  Song(
    imgUrl: 'assets/images/songs/dong_thoi_gian.jpg',
    singerName: 'Nguyễn Hải Phong',
    songName: 'Dòng thời gian',
    listenTimes: 10838,
  ),
  Song(
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
  ),
  Song(
    imgUrl: 'assets/images/tay_bac.jpg',
    singerName: 'Đoàn Thúy Trang',
    songName: 'Tình yêu màu nắng',
    listenTimes: 11052,
  ),
];

List<Widget> buildTop5Song(List<Song> songs) {
  // var sortedSongs = ... sort with listenTimes

  return songs
      .map((e) => ListTile(
            textColor: Colors.white70,
            selectedColor: Colors.white,
            selected: e.songName == 'Tình yêu màu nắng' ? true : false,
            leading: Container(
              width: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("1", style: TextStyle(fontSize: 20.0)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      e.imgUrl!,
                      height: 50.0,
                      width: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            title: Text(e.songName!),
            subtitle: Text(e.singerName!),
            trailing: GestureDetector(
              onTap: () {},
              child: Icon(Icons.more_vert_outlined, color: Colors.white70),
            ),
          ))
      .toList();
}
