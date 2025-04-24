import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/assets.dart';
import 'package:hand_cricket/widgets/hand_animation.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/background.png", fit: BoxFit.cover),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.sizeOf(context).height * 0.1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    runButton(
                      context,
                      image: Assets.oneImage,
                      onTap: () {},
                      screenSize: size,
                    ),
                    runButton(
                      context,
                      image: Assets.twoImage,
                      onTap: () {},
                      screenSize: size,
                    ),
                    runButton(
                      context,
                      image: Assets.threeImage,
                      onTap: () {},
                      screenSize: size,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    runButton(
                      context,
                      image: Assets.fourImage,
                      onTap: () {},
                      screenSize: size,
                    ),
                    runButton(
                      context,
                      image: Assets.fiveImage,
                      onTap: () {},
                      screenSize: size,
                    ),
                    runButton(
                      context,
                      image: Assets.sixImage,
                      onTap: () {},
                      screenSize: size,
                    ),
                  ],
                ),
              ],
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
                      handIndex: 2,
                    ),
                  ),
                  HandAnimation(
                    handIndex: 3,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector runButton(
    BuildContext context, {
    required Size screenSize,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        image,
        height: screenSize.height * 0.1,
        width: screenSize.width * 0.2,
      ),
    );
  }
}
