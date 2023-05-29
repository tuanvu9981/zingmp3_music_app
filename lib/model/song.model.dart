import 'package:flutter/material.dart';

class Song {
  String? singerName;
  String? songName;
  String? imgUrl;
  String? type;
  int? listenTimes;
  int? id;
  int? rankId;

  Song({
    this.singerName,
    this.songName,
    this.imgUrl,
    this.type,
    this.listenTimes,
    this.id,
    this.rankId,
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
    id: 0,
    imgUrl: 'assets/images/songs/denvau.jpg',
    singerName: 'Đen Vâu',
    songName: 'Nấu cơm cho em',
    listenTimes: 20184,
    rankId: 0,
  ),
  Song(
    id: 1,
    imgUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
    singerName: 'Tăng Duy Tân',
    songName: 'Bên trên tầng lầu',
    listenTimes: 18273,
    rankId: 1,
  ),
  Song(
    id: 2,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 2,
  ),
  Song(
    id: 3,
    imgUrl: 'assets/images/songs/dong_thoi_gian.jpg',
    singerName: 'Nguyễn Hải Phong',
    songName: 'Dòng thời gian',
    listenTimes: 10838,
    rankId: 3,
  ),
  Song(
    id: 4,
    imgUrl: 'assets/images/tay_bac.jpg',
    singerName: 'Đoàn Thúy Trang',
    songName: 'Tình yêu màu nắng',
    listenTimes: 11052,
    rankId: 4,
  ),
];

var top8Song = <Song>[
  Song(
    id: 0,
    imgUrl: 'assets/images/songs/denvau.jpg',
    singerName: 'Đen Vâu',
    songName: 'Nấu cơm cho em',
    listenTimes: 20184,
    rankId: 0,
  ),
  Song(
    id: 1,
    imgUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
    singerName: 'Tăng Duy Tân',
    songName: 'Bên trên tầng lầu',
    listenTimes: 18273,
    rankId: 1,
  ),
  Song(
    id: 2,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 2,
  ),
  Song(
    id: 3,
    imgUrl: 'assets/images/songs/dong_thoi_gian.jpg',
    singerName: 'Nguyễn Hải Phong',
    songName: 'Dòng thời gian',
    listenTimes: 10838,
    rankId: 3,
  ),
  Song(
    id: 4,
    imgUrl: 'assets/images/tay_bac.jpg',
    singerName: 'Đoàn Thúy Trang',
    songName: 'Tình yêu màu nắng',
    listenTimes: 11052,
    rankId: 4,
  ),
  Song(
    id: 5,
    imgUrl: 'assets/images/songs/denvau.jpg',
    singerName: 'Đen Vâu',
    songName: 'Nấu cơm cho em',
    listenTimes: 20184,
    rankId: 5,
  ),
  Song(
    id: 6,
    imgUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
    singerName: 'Tăng Duy Tân',
    songName: 'Bên trên tầng lầu',
    listenTimes: 18273,
    rankId: 6,
  ),
  Song(
    id: 7,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 7,
  ),
];

var topAllSong = <Song>[
  Song(
    id: 0,
    imgUrl: 'assets/images/songs/denvau.jpg',
    singerName: 'Đen Vâu',
    songName: 'Nấu cơm cho em',
    listenTimes: 20184,
    rankId: 0,
  ),
  Song(
    id: 1,
    imgUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
    singerName: 'Tăng Duy Tân',
    songName: 'Bên trên tầng lầu',
    listenTimes: 18273,
    rankId: 1,
  ),
  Song(
    id: 2,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 2,
  ),
  Song(
    id: 3,
    imgUrl: 'assets/images/songs/dong_thoi_gian.jpg',
    singerName: 'Nguyễn Hải Phong',
    songName: 'Dòng thời gian',
    listenTimes: 10838,
    rankId: 3,
  ),
  Song(
    id: 4,
    imgUrl: 'assets/images/tay_bac.jpg',
    singerName: 'Đoàn Thúy Trang',
    songName: 'Tình yêu màu nắng',
    listenTimes: 11052,
    rankId: 4,
  ),
  Song(
    id: 5,
    imgUrl: 'assets/images/songs/denvau.jpg',
    singerName: 'Đen Vâu',
    songName: 'Nấu cơm cho em',
    listenTimes: 20184,
    rankId: 5,
  ),
  Song(
    id: 6,
    imgUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
    singerName: 'Tăng Duy Tân',
    songName: 'Bên trên tầng lầu',
    listenTimes: 18273,
    rankId: 6,
  ),
  Song(
    id: 7,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 7,
  ),
  Song(
    id: 8,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 8,
  ),
  Song(
    id: 9,
    imgUrl: 'assets/images/songs/denvau.jpg',
    singerName: 'Đen Vâu',
    songName: 'Nấu cơm cho em',
    listenTimes: 20184,
    rankId: 9,
  ),
  Song(
    id: 10,
    imgUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
    singerName: 'Tăng Duy Tân',
    songName: 'Bên trên tầng lầu',
    listenTimes: 18273,
    rankId: 10,
  ),
  Song(
    id: 11,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 11,
  ),
  Song(
    id: 12,
    imgUrl: 'assets/images/songs/dong_thoi_gian.jpg',
    singerName: 'Nguyễn Hải Phong',
    songName: 'Dòng thời gian',
    listenTimes: 10838,
    rankId: 12,
  ),
  Song(
    id: 13,
    imgUrl: 'assets/images/tay_bac.jpg',
    singerName: 'Đoàn Thúy Trang',
    songName: 'Tình yêu màu nắng',
    listenTimes: 11052,
    rankId: 13,
  ),
  Song(
    id: 14,
    imgUrl: 'assets/images/songs/denvau.jpg',
    singerName: 'Đen Vâu',
    songName: 'Nấu cơm cho em',
    listenTimes: 20184,
    rankId: 14,
  ),
  Song(
    id: 15,
    imgUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
    singerName: 'Tăng Duy Tân',
    songName: 'Bên trên tầng lầu',
    listenTimes: 18273,
    rankId: 15,
  ),
  Song(
    id: 16,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 16,
  ),
  Song(
    id: 17,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 17,
  ),
  Song(
    id: 18,
    imgUrl: 'assets/images/songs/denvau.jpg',
    singerName: 'Đen Vâu',
    songName: 'Nấu cơm cho em',
    listenTimes: 20184,
    rankId: 18,
  ),
  Song(
    id: 19,
    imgUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
    singerName: 'Tăng Duy Tân',
    songName: 'Bên trên tầng lầu',
    listenTimes: 18273,
    rankId: 19,
  ),
  Song(
    id: 20,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 20,
  ),
  Song(
    id: 21,
    imgUrl: 'assets/images/songs/dong_thoi_gian.jpg',
    singerName: 'Nguyễn Hải Phong',
    songName: 'Dòng thời gian',
    listenTimes: 10838,
    rankId: 21,
  ),
  Song(
    id: 22,
    imgUrl: 'assets/images/tay_bac.jpg',
    singerName: 'Đoàn Thúy Trang',
    songName: 'Tình yêu màu nắng',
    listenTimes: 11052,
    rankId: 22,
  ),
  Song(
    id: 23,
    imgUrl: 'assets/images/songs/denvau.jpg',
    singerName: 'Đen Vâu',
    songName: 'Nấu cơm cho em',
    listenTimes: 20184,
    rankId: 23,
  ),
  Song(
    id: 24,
    imgUrl: 'assets/images/songs/ben_tren_tang_lau.jpeg',
    singerName: 'Tăng Duy Tân',
    songName: 'Bên trên tầng lầu',
    listenTimes: 18273,
    rankId: 24,
  ),
  Song(
    id: 25,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 25,
  ),
  Song(
    id: 26,
    imgUrl: 'assets/images/songs/she_neva_know.jpg',
    singerName: 'Justatee',
    songName: 'She Neva Know',
    listenTimes: 15002,
    rankId: 26,
  )
];

Color? selectColor(int rankId) {
  if (rankId == 1) {
    return Colors.lightBlue;
  } else if (rankId == 0) {
    return Colors.lightGreen;
  } else if (rankId == 2) {
    return Colors.red;
  } else {
    return Colors.white54;
  }
}

List<Widget> buildTopSong(List<Song> songs, int currentIndex) {
  // var sortedSongs = ... sort with listenTimes

  return songs
      .map(
        (e) => SizedBox(
          height: 55.0,
          child: ListTile(
            textColor: Colors.white54,
            selectedColor: Colors.white,
            selected: e.rankId == currentIndex,
            leading: Container(
              width: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${e.rankId! + 1}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: selectColor(e.rankId!),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      e.imgUrl!,
                      height: 40.0,
                      width: 40.0,
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
              child: Icon(Icons.more_vert_outlined, color: Colors.white54),
            ),
          ),
        ),
      )
      .toList();
}
