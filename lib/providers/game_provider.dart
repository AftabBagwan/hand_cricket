import 'dart:math';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  List runsScored = [];
  int computerRun = 0;

  void playMove(int run) {
    runsScored.add(run);
    computerRun = Random().nextInt(6) + 1;
    notifyListeners();
  }
}
