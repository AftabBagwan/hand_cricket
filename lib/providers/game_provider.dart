import 'dart:math';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  List runsScored = [];
  int computerRun = 0;
  bool isOut = false;
  bool overComplete = false;
  int totalScore = 0;

  void playMove(int run) {
    computerRun = Random().nextInt(6) + 1;
    if (run == computerRun) {
      isOut = true;
      notifyListeners();
      return;
    }
    runsScored.add(run);
    totalScore += run;
    if (runsScored.length == 6) {
      overComplete = true;
    }
    notifyListeners();
  }
}
