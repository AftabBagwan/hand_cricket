import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/assets.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key, required this.runsScored});
  final List runsScored;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Batting",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Column(
              children: List.generate(2, (rowIndex) {
                return Row(
                  children: List.generate(3, (index) {
                    bool ballPlayed =
                        (rowIndex * 3 + index) < runsScored.length;
                    return Container(
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ballPlayed ? Colors.green : Colors.transparent,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          ballPlayed
                              ? runsScored[rowIndex * 3 + index]
                                  .toString()
                              : "",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
            Text(
              "Player",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bowling",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Column(
              children: List.generate(2, (rowIndex) {
                return Row(
                  children: List.generate(3, (index) {
                    final ballIndex = rowIndex * 3 + index;
                    final totalBalls = 6;
                    final ballsPlayed = runsScored.length;
                    final isRemaining = ballIndex < totalBalls - ballsPlayed;
                    return Container(
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: isRemaining ? Colors.transparent : Colors.grey,
                        ),
                      ),
                      child:
                          isRemaining
                              ? Image.asset(
                                Assets.ballImage,
                                fit: BoxFit.cover,
                              )
                              : SizedBox.shrink(),
                    );
                  }),
                );
              }),
            ),
            Text(
              "Computer",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
