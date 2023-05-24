import 'package:flutter/material.dart';
import 'package:music_app/screen/home.dart';

void main() {
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: const Color.fromARGB(255, 105, 27, 119),
        secondaryHeaderColor: const Color.fromARGB(255, 62, 0, 73),
      ),
      home: const Home(),
    );
  }
}
