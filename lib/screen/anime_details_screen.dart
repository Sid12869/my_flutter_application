import 'package:flutter/material.dart';
import 'package:my_flutter_application/data/http/fetch_video.dart';
import 'package:my_flutter_application/data/models/anime.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../data/models/video.dart';

class AnimeDetailsScreen extends StatefulWidget {
  const AnimeDetailsScreen({Key? key, required this.anime}) : super(key: key);
  static const routeName = '/anime';
  final Anime anime;

  @override
  _AnimeDetailsScreenState createState() => _AnimeDetailsScreenState();
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
  late Future<SearchVideoList> videoList;

  @override
  void initState() {
    super.initState();
    var videoHelper = VideoHelper();
    videoList = videoHelper.getYoutube(widget.anime.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          elevation: 0,
        ),
        body: FutureBuilder<SearchVideoList>(
            future: videoList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.network(
                        widget.anime.movieBanner,
                        height: 240,
                        fit: BoxFit.fill,
                      ),
                      _AnimeTabView(
                        anime: widget.anime,
                        animeVideoId: snapshot.data!.items[0].id.videoId,
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            }));
  }
}

class _AnimeTabView extends StatelessWidget {
  _AnimeTabView({Key? key, required this.anime, required this.animeVideoId})
      : super(key: key);

  final Anime anime;
  final String animeVideoId;
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: "FWjiXOqRKhk",
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: const TabBar(
                          labelColor: Colors.green,
                          unselectedLabelColor: Colors.black,
                          tabs: [Tab(text: 'Synopsis'), Tab(text: 'Videos')],
                        ),
                      ),
                      Container(
                          height: 400, //height of TabBarView
                          child: TabBarView(children: <Widget>[
                            Column(
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(anime.title,
                                        style: const TextStyle(
                                          fontSize: 40,
                                          fontFamily: 'Gill Sans',
                                        ))),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(anime.description,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'Gill Sans',
                                        ))),
                              ],
                            ),
                            Container(
                                margin: const EdgeInsets.all(20),
                                child: YoutubePlayer(
                                    controller: _controller,
                                    showVideoProgressIndicator: true))
                          ]))
                    ])),
          ]),
    );
  }
}

  // 