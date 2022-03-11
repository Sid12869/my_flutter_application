import 'package:flutter/material.dart';
import 'package:my_flutter_application/data/models/anime.dart';

class AnimeDetailsScreen extends StatefulWidget {
  const AnimeDetailsScreen({Key? key, required this.anime}) : super(key: key);
  static const routeName = '/anime';
  final Anime anime;

  @override
  _AnimeDetailsScreenState createState() => _AnimeDetailsScreenState();
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.network(
                widget.anime.movieBanner,
                height: 240,
                fit: BoxFit.fill,
              ),
              _AnimeTabView(anime: widget.anime),
            ],
          ),
        ));
  }
}

class _AnimeTabView extends StatelessWidget {
  const _AnimeTabView({Key? key, required this.anime}) : super(key: key);

  final Anime anime;

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
                              child: const Center(
                                child: Text('Display Tab 2',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ]))
                    ])),
          ]),
    );
  }
}

  // 