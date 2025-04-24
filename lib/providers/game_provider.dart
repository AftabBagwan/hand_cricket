import 'dart:math';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  List playerScore = [];
  List computerScore = [];

  int computerRun = 0;
  bool isOut = false;
  bool overComplete = false;
  bool isPlayerBatting = true;

  int totalPlayerScore = 0;
  int totalComputerScore = 0;

  static const int maxBalls = 6;

  void playMove(int run) {
    computerRun = Random().nextInt(6) + 1;
    computerScore.add(computerRun);
    totalComputerScore += computerRun;

    //out
    if (run == computerRun) {
      isOut = true;
      isPlayerBatting = false;
      computerScore = [];
      totalComputerScore = 0;
      playerScore = [];
      notifyListeners();
      return;
    }

    //player
    if (isPlayerBatting) {
      playerScore.add(run);
      totalPlayerScore += run;

      if (playerScore.length >= maxBalls) {
        overComplete = true;
        isPlayerBatting = false;
        playerScore = [];
        computerScore = [];
        totalComputerScore = 0;
      }
    }

    notifyListeners();
  }
}
