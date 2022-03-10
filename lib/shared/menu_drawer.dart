import 'package:flutter/material.dart';

import '../screen/anime_list_screen.dart';
import '../screen/intro_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 185, 231, 131),
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }
}

List<Widget> buildMenuItems(BuildContext context) {
  final List<String> menuTitles = [
    'Home',
    'Anime List',
    'Seasonal Anime',
    'My List'
  ];

  List<Widget> menuItems = [];

  menuItems.add(const DrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/drawer_image.jpeg'),
              fit: BoxFit.cover)),
      child: Text('Anime Zone',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Gill Sans',
            fontSize: 28,
          ))));

  var items = menuTitles.map((item) => ListTile(
        title: Text(
          item,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Gill Sans',
          ),
        ),
        onTap: () {
          switch (item) {
            case 'Home':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const IntroScreen()));
              break;
            case 'Anime List':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimeListScreen()));
              break;
            default:
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const IntroScreen()));
          }
        },
      ));
  menuItems.addAll(items);

  return menuItems;
}
