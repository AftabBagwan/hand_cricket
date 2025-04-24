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
    playerRun = run;
    computerRun = _random.nextInt(6) + 1;

    _updateComputerScore();
    
    if (_checkOutCondition()) return;

    if (isPlayerBatting) _updatePlayerScore(run);

    notifyListeners();
  }

  void _updateComputerScore() {
    computerScore.add(computerRun);
    totalComputerScore += computerRun;
    runToWin -= computerRun;
  }

  bool _checkOutCondition() {
    if (playerRun != computerRun) return false;

    isOut = true;

    if (!isPlayerBatting) {
      playerWon = true;
      isOut = false;
      _resetForNewGame();
      notifyListeners();
      return true;
    }

    _resetAfterPlayerOut();

    Future.microtask(() {
      isOut = false;
      notifyListeners();
    });

    notifyListeners();
    return true;
  }

  void _updatePlayerScore(int run) {
    playerScore.add(run);
    totalPlayerScore += run;

    if (playerScore.length >= maxBalls) {
      overComplete = true;
      isPlayerBatting = false;
      _prepareForSecondInnings();
    }
  }

  void _resetAfterPlayerOut() {
    isPlayerBatting = false;
    runToWin = totalPlayerScore;

    playerScore.clear();
    computerScore.clear();
    totalComputerScore = 0;
  }

  void _prepareForSecondInnings() {
    playerScore.clear();
    computerScore.clear();
    totalComputerScore = 0;
    runToWin = totalPlayerScore;
  }

  void _resetForNewGame() {
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
    computerWon = false;
    // playerWon = false;
  }
}
