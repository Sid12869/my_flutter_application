import 'package:flutter/material.dart';

import '../screen/intro_screen.dart';

void main() {
  runApp( const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: const IntroScreen(),
    );
  }
}