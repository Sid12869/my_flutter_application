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
        backgroundColor: Color(0x44000000),
        elevation: 0,
      ),
        body: Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Image.network(
            widget.anime.movieBanner,
            height: 240,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(widget.anime.title,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Gill Sans',
              ))),
           Align(
            alignment: Alignment.topLeft,
            child: Text(widget.anime.description,
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Gill Sans',
              )))
        ],
      ),
    ));
  }
}
