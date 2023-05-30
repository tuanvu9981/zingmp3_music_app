## music_app

A Flutter project, simulating Zing Mp3 App

### Some illustration images of this app

### Technologies (Flutter libraries) in use
- **carousel_slider**: To create carousel effect in "New Release" section at main page.
- **syncfusion_flutter_charts**: To create chart, display mocked songs, listen times of each song by using **StackedLineSeries** chart type.
- **miniplayer**: To create mini-player section for song conclusion information at "Discover" tab.
- **audioplayers**: To play audio (.mp3) file in Flutter, as long as showing progress in Slider Widget.

### Take notes.
1. Need to provide size (height, width) for a Widget containing **Column**, **Row** (for example, **Container**)to prevent overflow and crash. Especially when ***using a ListView inside a Column or Row***.

2. With ZingMp3, using **SingleChildScrollView** with a child of **Column** could be considered as a good pratice.

3. To make AppBar scroll, using **SliverAppBar** with attribute ***floating:true***, inside **CustomSrollView**.
```
CustomScrollView(
    slivers: [
        SliverAppBar(
            floating: true,
            title: Text("Khám phá", style: tabTitleStyle),
            elevation: 0,
            backgroundColor: Colors.white,
            expandedHeight: screenHeight * 0.05,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
                buildTopImage(context, screenHeight, screenWidth),
                buildTopIcons(screenHeight, screenWidth),
                buildLatestListen(screenHeight, screenWidth),
                buildDiscovery(screenHeight, screenWidth),
                buildNewRelease(context, screenHeight, screenWidth),
                buildNotice(screenHeight, screenWidth),
                buildChart(screenHeight, screenWidth),
                buildPopular(screenHeight, screenWidth),
            ]),
        ),
    ],
)
```

4. Playing audio url file
- **Reference**: [audio-player-example-flutter](https://www.fluttercampus.com/guide/220/audio-player-example-flutter/)

- May 30th 2023, **audioplayers** has changed alot compared to reference documents. Almost provided methods changed from **Future<int>** into **Future<void>**

- **player.onAudioPositionChanged.listen((Duration  p){})** became deprecated. **player.onPositionChanged.listen((Duration  p){})** replaced it.

- How to use: [Official Documents](https://github.com/bluefireteam/audioplayers/blob/main/getting_started.md)

- 4 types of Source in **audioplayers** libraries:
    - **UrlSource**: get the audio from a remote URL from the Internet. This can be a direct link to a supported file to be downloaded, or a radio stream.
    - **DeviceFileSource**: access a file in the user's device, probably selected by a file picker
    - **AssetSource**: play an asset bundled with your app, normally within the assets directory
    - **BytesSource** (only some platforms): pass in the bytes of your audio directly (read it from anywhere).

- Assumed that **player** is an instance of **AudioPlayer**
    - **await player.play(AssetSource(localFile))**: Play an audio file inside assets folders. Therefore, assetUrl changed from **assets/audio/abc.mp3** to **audio/abc.mp3**
    - **await player.resume()**: Starts playback from current position (by default, from the start).
    - **await player.pause()**: Stops the playback but keeps the current position.
    - **await player.seek(Duration(milliseconds: 1200))**: Changes the current position (note: this does not affect the "playing" status).
    - **await player.stop()**: Stops the playback and also resets the current position.

