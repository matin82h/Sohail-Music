import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';

class Controller extends GetxController {

  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();
  final audioService = AudioService(); 

  var isPlay = false.obs;
  var loop_ = false.obs;
  var favorite = false.obs;

  var playIndex = 0.obs;

  var duration = ''.obs;
  var position = ''.obs;

  var max = 0.0.obs;
  var vp = 0.0.obs;

  updatePosition() {
    audioPlayer.durationStream.listen((d) {
      duration.value = d.toString().split(".")[0];
      max.value = d!.inSeconds.toDouble();
    });

    audioPlayer.positionStream.listen((p) {
      position.value = p.toString().split(".")[0];
      vp.value = p.inSeconds.toDouble();
    });
  }

  playMusic(String? uri, index){
    playIndex.value = index;
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!)));
    audioPlayer.play();
    isPlay(true);
    updatePosition();
    } on Exception catch  (e) {
        debugPrint(e.toString());

    }
  }

  changeDurationToSeconds(seconds){
    var duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
  }
}

