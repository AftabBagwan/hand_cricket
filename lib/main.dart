import 'package:flutter/material.dart';
import 'package:hand_cricket/providers/game_provider.dart';
import 'package:hand_cricket/screens/game_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hand Cricket',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GameProvider()),
        ],
        child: GameScreen(),
      ),
    );
  }
}