import 'package:flutter/material.dart';
import 'package:music_app/model/song.model.dart';
import 'package:music_app/widgets/info.banner.dart';
import 'package:music_app/widgets/info.line.dart';

class ListenSongScreen extends StatefulWidget {
  const ListenSongScreen({super.key});

  @override
  ListenSongScreenState createState() => ListenSongScreenState();
}

class ListenSongScreenState extends State<ListenSongScreen>
    with TickerProviderStateMixin {
  final _gradientColor = const LinearGradient(
    colors: [
      Color.fromARGB(255, 129, 121, 121),
      Color.fromARGB(255, 158, 158, 158),
      Colors.grey,
    ],
  );
  late TabController _tabController;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
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

  Widget _buildPlayingSongTab() {
    return Container();
  }

  Widget _buildSongLyricTab() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
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
                _buildPlayingSongTab(),
                _buildSongLyricTab(),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          height: _selectedIndex == 1 ? 230.0 : 125.0,
          decoration: BoxDecoration(gradient: _gradientColor),
        ),
      ),
    );
  }
}
