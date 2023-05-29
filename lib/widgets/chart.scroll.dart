import 'package:flutter/material.dart';
import 'package:music_app/model/graph.model.dart';
import 'package:music_app/model/song.model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScroll extends StatefulWidget {
  const ChartScroll({super.key});

  @override
  State<ChartScroll> createState() => ChartScrollState();
}

class ChartScrollState extends State<ChartScroll> {
  int _currentIndexSong = 0;
  bool _all = false;

  Widget buildSongList(double h, double w) {
    return Container(
      padding: EdgeInsets.only(top: _all == false ? 0 : 17.5),
      decoration: BoxDecoration(
        color: const Color(0xff1f005c),
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...buildTopSong(
              _all == false ? top8Song : topAllSong,
              _currentIndexSong,
            ),
            _all == false
                ? Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _all = true;
                        });
                      },
                      child: Container(
                        width: w * 0.2,
                        height: h * 0.025,
                        margin: const EdgeInsets.symmetric(vertical: 17.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 0.25, color: Colors.grey),
                        ),
                        child: const Center(
                          child: Text(
                            "XEM THÊM",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(height: 25.0),
            Container(
              padding: EdgeInsets.only(top: _all == false ? 0 : 17.5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 55, 49, 78),
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12.5),
                      width: double.infinity,
                      child: const Row(
                        children: [
                          Text(
                            "#zingchart tuần",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.5,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 7.5,
                      ),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 0, 27, 1),
                          Color.fromARGB(255, 55, 97, 0),
                          Color.fromARGB(255, 126, 148, 0),
                        ]),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/images/songs/dong_thoi_gian.jpg',
                              height: 110.0,
                              width: 110.0,
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "V-POP",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                "1. Trách duyên trách phận",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "2. Mật ngọt",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "3. Họ Đâu Thương Em",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 7.5,
                      ),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Colors.grey,
                          Color.fromARGB(255, 71, 66, 66),
                          Color.fromARGB(255, 39, 37, 37),
                        ]),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/images/songs/dong_thoi_gian.jpg',
                              height: 110.0,
                              width: 110.0,
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "V-POP",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                "1. Trách duyên trách phận",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "2. Mật ngọt",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "3. Họ Đâu Thương Em",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChart(double screenHeight) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      height: screenHeight * 0.25,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: NumericAxis(
          labelStyle: const TextStyle(color: Colors.white),
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
          isVisible: false,
        ),
        trackballBehavior: TrackballBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
        ),
        series: getSongSeries(_currentIndexSong),
      ),
    );
  }

  Widget buildHeader() {
    final now = DateTime.now();
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '${now.day}.${now.month}.${now.year} - ${now.hour}:00',
            style: const TextStyle(
              fontSize: 16.5,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10.0),
          const Icon(
            Icons.play_circle,
            size: 20.0,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 60, 15, 150),
      ),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(colors: [
                Colors.orange,
                Colors.pink,
                Colors.purple,
                Colors.lightBlue,
              ]).createShader(bounds),
              child: const Text(
                "#zingchart",
                style: TextStyle(
                  fontSize: 27.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 60, 15, 150),
            expandedHeight: screenHeight * 0.05,
            actions: const [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.mic, color: Colors.white, size: 25.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(Icons.search, color: Colors.white, size: 25.0),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              buildHeader(),
              buildChart(screenHeight),
              const SizedBox(height: 15.0),
              buildSongList(screenHeight, screenWidth),
              const SizedBox(height: 40.0),
            ]),
          ),
        ],
      ),
    );
  }
}
