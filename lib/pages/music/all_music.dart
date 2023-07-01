import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'class/controller.dart';
import 'play.dart';

class AllMusic extends StatefulWidget {
  const AllMusic({super.key});

  @override
  State<AllMusic> createState() => _AllMusicState();
}

class _AllMusicState extends State<AllMusic> {
  final dataController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<SongModel>>(
        future: dataController.audioQuery.querySongs(
          sortType: null,
          ignoreCase: true,
          uriType: UriType.EXTERNAL,
          orderType: OrderType.ASC_OR_SMALLER,
        ),
        builder: (context, item) {
          if (item.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (item.data!.isEmpty) {
            return const Center(
              child: Text("No Music Found"),
            );
          }

          return ListView.builder(
            itemCount: item.data!.length,
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 8, right: 14, left: 14, bottom: 12.5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          child: ClipRRect(
                            child: QueryArtworkWidget(
                              controller: dataController.audioQuery,
                              id: item.data![index].id,
                              type: ArtworkType.AUDIO,
                              artworkQuality: FilterQuality.high,
                              nullArtworkWidget: const Icon(
                                  Icons.music_note_rounded,
                                  size: 50,
                                  color: Colors.black),
                              artworkWidth: 50,
                              artworkHeight: 50,
                              artworkBorder: const BorderRadius.horizontal(
                                  left: Radius.circular(6),
                                  right: Radius.circular(6)),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              if (true) {
                                if (true == dataController.isPlay.value) {
                                  if (dataController.playIndex() == index) {
                                    dataController.audioPlayer.pause();
                                    dataController.isPlay(false);
                                  } else if (dataController.isPlay(true)) {
                                    dataController.isPlay(true);
                                    dataController.playMusic(
                                        item.data![index].uri, index);
                                  }
                                } else {
                                  dataController.audioPlayer.play();
                                  dataController.isPlay(true);

                                  dataController.playMusic(
                                      item.data![index].uri, index);
                                }
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 220,
                            child: InkWell(
                              onTap: () {
                                
                                setState(() {
                                  Get.to(PlayAudio(getData: item.data!));
                                  dataController.playMusic(
                                      item.data![index].uri, index);
                                });
                              },
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  item.data![index].title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 220,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      Get.to(PlayAudio(getData: item.data!));
                                    });
                                    setState(() {
                                      dataController.playMusic(
                                          item.data![index].uri, index);
                                    });
                                  },
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      item.data![index].artist != '<unknown>'
                                          ? item.data![index].artist.toString()
                                          : '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.5,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 37.5,
                        width: 37.5,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(30)),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (true == dataController.isPlay.value) {
                                if (dataController.playIndex() == index) {
                                  dataController.audioPlayer.pause();
                                  dataController.isPlay(false);
                                } else if (dataController.isPlay(true)) {
                                  dataController.isPlay(true);

                                  dataController.playMusic(
                                      item.data![index].uri, index);
                                }
                              } else if (false == dataController.isPlay.value) {
                                dataController.audioPlayer.play();
                                dataController.isPlay(true);

                                dataController.playMusic(
                                    item.data![index].uri, index);
                              } else {
                                dataController.audioPlayer.play();
                                dataController.isPlay(true);

                                dataController.playMusic(
                                    item.data![index].uri, index);
                              }
                            });
                          },
                          child: dataController.playIndex.value == index &&
                                  dataController.isPlay.value
                              ? const Icon(Icons.pause,
                                  size: 27.5, color: Colors.white)
                              : const Icon(Icons.play_arrow,
                                  size: 27.5, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
