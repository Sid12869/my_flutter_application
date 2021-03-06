import 'package:flutter/material.dart';

import '../shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anime Zone')),
      drawer: const MenuDrawer(),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dashboard_image.webp'),
                  fit: BoxFit.cover)),
          child: Center(
              child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white70),
            child: const Text(
              'Jump into the world of anime',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Gill Sans',
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ))),
    );
  }
}
