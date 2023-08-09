import 'package:assignment_1/app_theam/app_colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlay extends StatefulWidget {
  const AudioPlay({Key? key}) : super(key: key);

  @override
  State<AudioPlay> createState() => _AudioPlayState();
}

class _AudioPlayState extends State<AudioPlay> {

  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds){
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8,'0');
  }

  @override
  void initState() {
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Audio Play',style: TextStyle(color: primaryColor),),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: primaryColor,)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 200,),

             Container(
               height: 300,
               width: 500,
             decoration: BoxDecoration(
               image: DecorationImage(
                 fit: BoxFit.fill,
                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg-3382ZgdUhzsOz0VYE8KVNtX_HTwTxRSps08Nli1&s')
               )
             ),
             ),
              SizedBox(height: 30,),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value){
                  final position= Duration(seconds: value.toInt());
                  player.seek(position);
                  player.resume();
                },
              ),
              Container(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position.inSeconds)),
                    Text(formatTime((duration-position).inSeconds))
                  ],
                ),
              ),
              Center(
                child: CircleAvatar(
                  radius: 35,
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        isPlaying? Icons.pause:Icons.play_arrow
                      ),
                      iconSize: 50,
                      onPressed: ()async{
                        if(isPlaying){
                          await player.pause();
                        } else{
                          await player.play(AssetSource('audio.mp3'));
                        }
                    },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
