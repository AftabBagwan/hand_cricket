import 'dart:math';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  List runsScored = [];
  int computerRun = 0;
  bool isOut = false;

  void playMove(int run) {
    computerRun = Random().nextInt(6) + 1;
    if (run == computerRun) {
      isOut = true;
      notifyListeners();
      return;
    }
    runsScored.add(run);
    notifyListeners();
  }
}
