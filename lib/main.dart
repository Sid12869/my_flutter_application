import 'package:flutter/material.dart';
import 'package:my_flutter_application/data/models/anime.dart';

import 'screen/intro_screen.dart';
import 'screen/anime_details_screen.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == AnimeDetailsScreen.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as Anime;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return AnimeDetailsScreen(
                anime: args,
              );
            },
          );
        }
        return null;
      },
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: const IntroScreen(),
    );
  }
}
