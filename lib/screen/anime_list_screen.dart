import 'package:flutter/material.dart';
import 'package:my_flutter_application/data/http/fetch_anime.dart';

import '../data/models/anime.dart';
import '../shared/menu_drawer.dart';
import 'anime_details_screen.dart';

class AnimeListScreen extends StatefulWidget {
  const AnimeListScreen({Key? key}) : super(key: key);

  @override
  State<AnimeListScreen> createState() => _AnimeListScreenState();
}

class _AnimeListScreenState extends State<AnimeListScreen> {
  late Future<List<Anime>> animeList;

  @override
  void initState() {
    super.initState();
    var animeHelper = AnimeHelper();
    animeList = animeHelper.getAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anime List')),
      drawer: const MenuDrawer(),
      body: Center(
        child: FutureBuilder<List<Anime>>(
            future: animeList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 40),
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AnimeDetailsScreen.routeName,
                              arguments: snapshot.data![index],
                            );
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(snapshot.data![index].image,
                                  fit: BoxFit.fitHeight)));
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
