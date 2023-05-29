import 'package:flutter/material.dart';

class BannerInfo extends StatelessWidget {
  String imageUrl;
  String song;
  String singer;

  BannerInfo({
    super.key,
    required this.imageUrl,
    required this.song,
    required this.singer,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(imageUrl, height: 75, width: 75),
        ),
        const SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              singer,
              style: const TextStyle(color: Colors.white, fontSize: 15.0),
            ),
            const SizedBox(height: 5.0),
            Container(
              width: screenWidth * 0.4,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    Text(
                      '12.1k',
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                  Row(children: [
                    Icon(
                      Icons.headphones,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    Text(
                      '158.6k',
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
