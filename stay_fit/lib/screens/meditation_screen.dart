import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stay_fit/widgets/custom_list_tile.dart';

// ignore: camel_case_types
class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

// ignore: camel_case_types
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Meditation ",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
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
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Color(0x55212121)),
            ]),
            child: Column(
              children: [
                Slider.adaptive(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) {}),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                                image: NetworkImage(currentCover))),
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
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            // Text(
                            //   singer,
                            //   style:TextStyle(color:Colors.grey,fontSize:14.0),
                            // ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (isPlaying) {
                            audioPlayer.pause();
                            setState(() {
                              btnIcon = Icons.pause;
                              isPlaying = false;
                            });
                          } else {
                            audioPlayer.resume();
                            setState(() {
                              btnIcon = Icons.play_arrow;
                              isPlaying = true;
                            });
                          }
                        },
                        iconSize: 42.0,
                        icon: Icon(btnIcon),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


     






































// import 'package:flutter/material.dart';
// import 'package:stay_fit/widgets/custom_bottom_navbar.dart';


// class MeditationScreen extends StatelessWidget {
//   final fontFamily = "Roboto" ;
  
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        bottomNavigationBar: CustomBottonNavBar(),
//       body: Column(
       
//         children: <Widget>[
//           Expanded(
//             child: SingleChildScrollView(
             
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   //Container for playlist header
//                   SizedBox(height: 40,),
//                   Container(
//                     padding: EdgeInsets.only(left: 32, right: 32),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text("Meditation Page", style: TextStyle(color: Colors.grey, fontFamily: fontFamily, fontWeight: FontWeight.w900, letterSpacing: 1),),
//                             SizedBox(width: 4,),
                            
//                           ],
//                         ),

//                 //         //Container for button down button
//                 //         Container(
//                 //           padding: EdgeInsets.all(8),
//                 //           decoration: BoxDecoration(
//                 //             color: Colors.white,
//                 // //            boxShadow: [BoxShadow(color: Colors.grey[200], spreadRadius: 1.0, blurRadius: 8.0)],
//                 //             borderRadius: BorderRadius.all(Radius.circular(50)),

//                 //           ),
//                 //           child: Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30,),
//                 //         )
//                       ],
//                     ),
//                   ),

//                   SizedBox(height: 40,),
//                   //Container for ListView of playlist
//                   ListView.separated(
//                     padding: EdgeInsets.symmetric(horizontal: 32),
//                       itemBuilder: (context, index){
//                         return Row(
//                           children: <Widget>[
//                             IconButton(
//                               icon: Icon(Icons.play_circle_outline, size: 30, color: Colors.grey[700],), onPressed: () {  },
//                             ),

//                             SizedBox(width: 32,),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Text("Oscar Hayes", style: TextStyle(color: Colors.grey, fontFamily: fontFamily, fontWeight: FontWeight.w900, letterSpacing: 0.5),),
//                                   SizedBox(height: 4,),
//                                   Text("The Dawn", style: TextStyle(color: Colors.grey[900], fontFamily: fontFamily, fontWeight: FontWeight.w700, letterSpacing: 1.5, fontSize: 22),)
//                                 ],
//                               ),
//                             ),

//                             Text("03:02", style: TextStyle(color: Colors.grey, fontFamily: fontFamily, fontWeight: FontWeight.w900, letterSpacing: 0.5),)
//                           ],
//                         );
//                       },
//                       separatorBuilder: (context, index) =>Divider(height: 40,),
//                       itemCount: 6,
//                     shrinkWrap: true,
//                     controller: ScrollController(keepScrollOffset: false),
//                   ),

//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 40,),
//           //Container for blue PlayContainer
//           // Container(
//           //   padding: EdgeInsets.all(32),
//           //   color: Colors.lightBlue,
//           //   width: double.infinity,
//           //   child: Row(
//           //     children: <Widget>[
//           //       IconButton(icon: Icon(Icons.play_circle_outline, size: 30, color: Colors.white,), color: Colors.white, onPressed: () {  },),

//           //       SizedBox(width: 32,),

//           //       Expanded(
//           //         child: Column(
//           //           crossAxisAlignment: CrossAxisAlignment.start,
//           //           children: <Widget>[
//           //             Text("Oscar Hayes", style: TextStyle(color: Colors.white, fontFamily: fontFamily, fontWeight: FontWeight.w300, letterSpacing: 0.5),),
//           //             Text("The Dawn", style: TextStyle(color: Colors.grey[100], fontFamily: fontFamily, fontWeight: FontWeight.w500, letterSpacing: 1.5, fontSize: 22),),
//           //           ],
//           //         ),
//           //       ),

//           //       SizedBox(width: 32,),
//           //       Container(
//           //         padding: EdgeInsets.all(8),
//           //         decoration: BoxDecoration(
//           //           color: Colors.white,
//           //         //  boxShadow: [BoxShadow(color: Colors.grey[200], spreadRadius: 1.0, blurRadius: 8.0)],
//           //           borderRadius: BorderRadius.all(Radius.circular(50)),
//           //         ),
//           //         child: Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30,),
//           //       )
//           //     ],
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }
