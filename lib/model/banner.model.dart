class BannerModel {
  String title;
  String imgUrl;
  String type;

  BannerModel({required this.title, required this.imgUrl, required this.type});
}

final discoverList = <BannerModel>[
  BannerModel(
    title: 'Top 100 Hoa Ngữ',
    imgUrl: 'assets/images/top100_big_image.png',
    type: 'playlist',
  ),
  BannerModel(
    title: 'Âm nhạc vùng Tây Bắc',
    imgUrl: 'assets/images/tay_bac.jpg',
    type: 'playlist',
  ),
  BannerModel(
    title: 'Nhạc Nhật gây nghiện tháng 10/2023',
    imgUrl: 'assets/images/japan_music.jpeg',
    type: 'playlist',
  ),
  BannerModel(
    title: 'Kpop new hits 2023',
    imgUrl: 'assets/images/bts_kpop.jpeg',
    type: 'playlist',
  ),
  BannerModel(
    title: 'Nhạc chill',
    imgUrl: 'assets/images/chill_music.jpg',
    type: 'playlist',
  ),
  BannerModel(
    title: 'Những bài hát hay nhất của Bích Phương',
    imgUrl: 'assets/images/bichphuong.jpeg',
    type: 'singer',
  ),
  BannerModel(
    title: 'Những bài hát hay nhất của Justatee',
    imgUrl: 'assets/images/justatee.jpeg',
    type: 'singer',
  ),
  BannerModel(
    title: '',
    imgUrl: '',
    type: 'all',
  ),
];

final latestListenSongs = <BannerModel>[
  BannerModel(
    title: 'Những bài hát hay nhất của Thùy Chi',
    imgUrl: 'assets/images/songs/thanh_thi.jpg',
    type: 'playlist',
  ),
  BannerModel(
    title: 'Kpop new hits 2023',
    imgUrl: 'assets/images/bts_kpop.jpeg',
    type: 'playlist',
  ),
  BannerModel(
    title: 'Nhạc chill',
    imgUrl: 'assets/images/chill_music.jpg',
    type: 'playlist',
  ),
  BannerModel(
    title: 'Best hit maker ever - Avichi',
    imgUrl: 'assets/images/songs/the-night-avichi.jpeg',
    type: 'playlist',
  ),
  BannerModel(
    title: 'Những bài hát hay nhất của Bích Phương',
    imgUrl: 'assets/images/bichphuong.jpeg',
    type: 'singer',
  ),
  BannerModel(
    title: '',
    imgUrl: '',
    type: 'all',
  ),
];
