import 'dart:math';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  static const int maxBalls = 6;

  List<int> playerScore = [];
  List<int> computerScore = [];

  int computerRun = 0;
  int playerRun = 0;

  int totalPlayerScore = 0;
  int totalComputerScore = 0;
  int runToWin = 0;

  bool isOut = false;
  bool overComplete = false;
  bool isPlayerBatting = true;
  bool computerWon = false;
  bool playerWon = false;

  final Random _random = Random();

  void playMove(int run) {
    if (playerWon || computerWon) return;

    playerRun = run;
    computerRun = _random.nextInt(6) + 1;

    if (run == computerRun) {
      _handleOut();
      return;
    }

    if (isPlayerBatting) {
      _updatePlayerScore(run);
    } else {
      _updateComputerScore();
    }

    notifyListeners();
  }

  void _handleOut() {
    isOut = true;
    notifyListeners();

    if (!isPlayerBatting) {
      playerWon = true;
      resetForNewGame();
      return;
    }

    isPlayerBatting = false;
    runToWin = totalPlayerScore;
    playerScore.clear();
    computerScore.clear();
    totalComputerScore = 0;

    Future.microtask(() {
      isOut = false;
      notifyListeners();
    });
  }

  void _updatePlayerScore(int run) {
    playerScore.add(run);
    totalPlayerScore += run;

    if (playerScore.length >= maxBalls) {
      overComplete = true;
      isPlayerBatting = false;
      runToWin = totalPlayerScore;
      playerScore.clear();
      computerScore.clear();
      totalComputerScore = 0;
    }
  }

  void _updateComputerScore() {
    computerScore.add(computerRun);
    totalComputerScore += computerRun;
    runToWin -= computerRun;

    if (runToWin <= 0) {
      computerWon = true;
      resetForNewGame();
    } else if (computerScore.length >= maxBalls) {
      playerWon = true;
      resetForNewGame();
    }
  }

  void resetForNewGame() {
    playerScore.clear();
    computerScore.clear();

    computerRun = 0;
    playerRun = 0;

    totalPlayerScore = 0;
    totalComputerScore = 0;
    runToWin = 0;

    isOut = false;
    overComplete = false;
    isPlayerBatting = true;
    notifyListeners();
  }
}
