import 'package:flutter/material.dart';
import 'package:music_app/model/banner.model.dart';

class BannerCard extends StatelessWidget {
  final double bHeight;
  final double bWidth;
  final double fontSize;
  final BannerModel banner;
  const BannerCard({
    super.key,
    required this.bHeight,
    required this.bWidth,
    required this.banner,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          banner.type == 'playlist'
              ? Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image(
                        width: bWidth,
                        height: bHeight,
                        image: AssetImage(banner.imgUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(2.5),
                      child: const Icon(
                        Icons.play_circle,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              : banner.type == 'singer'
                  ? CircleAvatar(
                      radius: bWidth / 2,
                      backgroundImage: AssetImage(banner.imgUrl),
                    )
                  : Container(
                      height: bHeight,
                      width: bWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 32.5,
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            'Xem tất cả',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
          const SizedBox(height: 6.0),
          Container(
            width: bWidth,
            child: Text(
              banner.title,
              style: TextStyle(fontSize: fontSize),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
