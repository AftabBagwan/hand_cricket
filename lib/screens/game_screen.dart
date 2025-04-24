import 'package:flutter/material.dart';
import 'package:hand_cricket/providers/game_provider.dart';
import 'package:hand_cricket/utils/assets.dart';
import 'package:hand_cricket/widgets/hand_animation.dart';
import 'package:hand_cricket/widgets/run_button.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final runButtons = [
    {'run': 1, 'image': Assets.oneImage},
    {'run': 2, 'image': Assets.twoImage},
    {'run': 3, 'image': Assets.threeImage},
    {'run': 4, 'image': Assets.fourImage},
    {'run': 5, 'image': Assets.fiveImage},
    {'run': 6, 'image': Assets.sixImage},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Consumer<GameProvider>(
        builder: (context, gameProvider, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset("assets/background.png", fit: BoxFit.cover),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.sizeOf(context).height * 0.1,
                child: Column(
                  children: List.generate(2, (rowIndex) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (index) {
                        final run = runButtons[rowIndex * 3 + index];
                        return RunButton(
                          image: run['image'] as String,
                          onTap: () {
                            gameProvider.playMove(run['run'] as int);
                          },
                          size: size.height * 0.1,
                        );
                      }),
                    );
                  }),
                ),
              ),
              Positioned(
                top: size.height * 0.2,
                child: Container(
                  height: size.height * 0.2,
                  width: size.width - 40,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform(
                        transform: Matrix4.identity()..rotateY(3.14),
                        alignment: Alignment.center,
                        child: HandAnimation(
                          handIndex:
                              gameProvider.runsScored.isNotEmpty
                                  ? gameProvider.runsScored.last
                                  : 0,
                        ),
                      ),
                      HandAnimation(handIndex: gameProvider.computerRun),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
