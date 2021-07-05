import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stay_fit/widgets/custom_list_tile.dart';
import 'package:stay_fit/widgets/countdown_timer.dart';
import 'package:stay_fit/widgets/custom_bottom_navbar.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  List musicList = [
    {
      'title': "Chirping Birds",
      'url':
          "https://assets.mixkit.co/sfx/preview/mixkit-birds-in-forest-loop-1239.mp3",
      'Coverurl':
          "https://i.pinimg.com/564x/fb/c2/74/fbc274104236e1f0c74f023511c2e88f.jpg"
    },
    {
      'title': "Forest Ambience",
      'url':
          "https://assets.mixkit.co/sfx/preview/mixkit-european-forest-ambience-1213.mp3",
      'Coverurl':
          "https://i.pinimg.com/564x/1f/f2/34/1ff2348f3ac6d93e9f6e5cb3a01a3ee0.jpg"
    },
    {
      'title': "Light Rain",
      'url':
          "https://assets.mixkit.co/sfx/preview/mixkit-light-rain-loop-1253.mp3",
      'Coverurl':
          "https://i.pinimg.com/564x/e0/cb/34/e0cb3486c4a9e8e27d55d809dfedc9c8.jpg"
    },
    {
      'title': "Morning Dew",
      'url':
          "https://assets.mixkit.co/sfx/preview/mixkit-swamp-and-jungle-birds-ambience-325.mp3",
      'Coverurl':
          "https://i.pinimg.com/564x/f0/8b/1f/f08b1fbc5e260341e3379a962414463c.jpg"
    }
  ];

  String currentTitle = "";
  String currentCover = "";
  IconData btnIcon = Icons.play_arrow;
  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";
  Duration duration = new Duration();
  Duration position = new Duration();

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
        appBar: AppBar(), 
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CountDownTimer(), 
            Expanded(
              child: ListView.builder(
                  itemCount: musicList.length,
                  itemBuilder: (context, index) => customListTile(
                      onTap: () {
                        playMusic(musicList[index]['url']);
                        setState(() {
                          currentTitle = musicList[index]['title'];
                          currentCover = musicList[index]['Coverurl'];
                        });
                      },
                      title: musicList[index]['title'],
                      cover: musicList[index]['Coverurl'])),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xff434343), Color(0xff000000)],
                ),
              ),
              margin: const EdgeInsets.only(
                top: 10, 
                bottom: 10, 
                left: 20,
                right: 20,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    Slider.adaptive(
                        value: position.inSeconds.toDouble(),
                        min: 0.0,
                        max: duration.inSeconds.toDouble(),
                        onChanged: (value) {}),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        right: 12.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.0,
                            width: 30.0,
                            child: Icon(
                              Icons.music_note_rounded,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentTitle,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (isPlaying) {
                                audioPlayer.pause();
                                setState(() {
                                  btnIcon = Icons.play_arrow;
                                  isPlaying = false;
                                });
                              } else {
                                audioPlayer.resume();
                                setState(() {
                                  btnIcon = Icons.pause; 
                                  isPlaying = true;
                                });
                              }
                            },
                            iconSize: 30.0,
                            icon: Icon(btnIcon, color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottonNavBar(),
      ),
    );
  }
}
