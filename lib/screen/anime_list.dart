 import 'package:flutter/material.dart';

import '../shared/menu_drawer.dart';


class AnimeList extends StatelessWidget {
  const AnimeList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anime List')),
      drawer: const MenuDrawer(),
      body: const Center(child: FlutterLogo(),),
    );
  }
}