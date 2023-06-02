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

5. Playing lyric along with mp3 sound
- **Reference**: [audio-player-example-flutter](https://github.com/ozyl/flutter_lyric/blob/master/example/lib/main.dart)
- First, create a String lyric variables as below:
```
const normalLyrics = """[ti:Bên trên tầng lầu]
[ar:Tăng Duy Tân]
[al:Bên trên tầng lầu]
[by:]
[offset:0]
[00:24.00]Em ơi đừng khóc bóng tối trước mắt sẽ bắt em đi

[00:27.00]Em ơi đừng lo, em ơi đừng cho tương lai vụt tắt

...
"""

```
- Then, import String lyrics:
```
var lyricModel = LyricsModelBuilder.create()
    .bindLyricToMain(normalLyrics)
    .getModel();
```

- If you want to make translation lyrics, you'll need another String lyric with translated lyrics, and import those 2 as belows:
```
var lyricModel = LyricsModelBuilder.create()
    .bindLyricToMain(normalLyrics)
    .bindLyricToExt(transLyric)
    .getModel();
```

- To make lyric run along, synchronous with mp3 sounding, just need to provide **boolean: isPlaying**, **int: position** and **lyricModel** as below

```
LyricsReader(
    padding: EdgeInsets.symmetric(horizontal: lyricPadding),
    model: lyricModel,
    position: currentPosition,
    lyricUi: lyricUI,
    playing: isPlaying,
    size: Size(
        double.infinity,
        MediaQuery.of(context).size.height * 0.9,
    ),
    emptyBuilder: () => Center(
        child: Text(
            "No lyrics",
            style: lyricUI.getOtherMainTextStyle(),
        ),
    ),
);
```