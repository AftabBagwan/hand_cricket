import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/assets.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({
    super.key,
    required this.playerScore,
    required this.isPlayerBatting,
    required this.computerScore,
  });
  final List playerScore;
  final List computerScore;
  final bool isPlayerBatting;

  static const int totalBalls = 6;

  @override
  Widget build(BuildContext context) {
    List score = isPlayerBatting ? playerScore : computerScore;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _scoreColumn(
          isPlayerBatting ? "Batting" : "Bowling",
          "Player",
          isBatting: isPlayerBatting,
          score: playerScore,
        ),
        _scoreColumn(
          isPlayerBatting ? "Bowling" : "Batting",
          "Computer",
          isBatting: !isPlayerBatting,
          score: computerScore,
        ),
      ],
    );
  }

  Widget _scoreColumn(
    String topLabel,
    String bottomLabel, {
    required bool isBatting,
    required List score,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(topLabel),
        Column(
          children: List.generate(2, (row) {
            return Row(
              children: List.generate(3, (col) {
                int index = row * 3 + col;

                if (isBatting) {
                  bool ballPlayed = index < score.length;
                  return _circle(
                    content: ballPlayed ? score[index].toString() : '',
                    color: ballPlayed ? Colors.green : Colors.transparent,
                    hasBorder: true,
                  );
                } else {
                  bool showBall = index < totalBalls - score.length;
                  return _circle(
                    content: showBall ? null : '',
                    image: showBall ? Assets.ballImage : null,
                    hasBorder: !showBall,
                  );
                }
              }),
            );
          }),
        ),
        _label(bottomLabel),
      ],
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  Widget _circle({
    String? content,
    String? image,
    Color? color,
    bool hasBorder = false,
  }) {
    return Container(
      height: 30,
      width: 30,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Colors.transparent,
        border: hasBorder ? Border.all(color: Colors.grey) : null,
      ),
      child: Center(
        child:
            image != null
                ? Image.asset(image, fit: BoxFit.cover)
                : Text(
                  content ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
      ),
    );
  }
}
