import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/assets.dart';
import 'package:rive/rive.dart' as rive;

class WelcomeDialog extends StatefulWidget {
  const WelcomeDialog({super.key});

  @override
  State<WelcomeDialog> createState() => _WelcomeDialogState();
}

class _WelcomeDialogState extends State<WelcomeDialog> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.amber),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.red.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            buildBackgroundHandAnimation(isLeft: true, animation: 'Three'),
            buildBackgroundHandAnimation(isLeft: false, animation: 'One'),
            Container(
              color: Colors.black.withValues(alpha: 0.4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Text(
                      "How to play",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  buildStepOne(),
                  buildStepTwo(),
                  buildStepThree(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: screenWidth * 0.7,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.amber.shade300,
                            Colors.amber.shade700,
                          ],
                        ),
                      ),
                      child: const Text(
                        "Start Playing",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBackgroundHandAnimation({
    required bool isLeft,
    required String animation,
  }) {
    return Positioned(
      left: isLeft ? -50 : null,
      right: isLeft ? null : -30,
      top: isLeft ? null : -5,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateY(isLeft ? 3.14 : 0),
        child: SizedBox(
          height: 160,
          width: 160,
          child: rive.RiveAnimation.asset(
            Assets.riveFile,
            animations: [animation],
          ),
        ),
      ),
    );
  }

  Widget buildStepOne() {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _stepIndicator('1'),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              "Tap the buttons to score Runs",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ClipRRect(
            clipBehavior: Clip.antiAlias,
            child: Transform.translate(
              offset: const Offset(25, 0),
              child: Row(
                children:
                    [Assets.threeImage, Assets.twoImage, Assets.oneImage]
                        .map(
                          (asset) => Image.asset(asset, height: 52, width: 52),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStepTwo() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Row(
          children: [
            _buildStepTwoOut(),
            const SizedBox(width: 10),
            _buildStepTwoScore(),
          ],
        ),
      ),
    );
  }

  Widget _buildStepTwoOut() {
    return Expanded(
      flex: 55,
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 20),
        color: Colors.black,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _stepIndicator('2'),
            const SizedBox(width: 16),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Same Number:",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text("You're out!", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  _positionedHand(
                    isReversed: true,
                    animation: 'Three',
                    offset: Offset(20, 20),
                  ),
                  _positionedHand(
                    isReversed: false,
                    animation: 'Three',
                    offset: Offset(20, -6),
                    alignBottom: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepTwoScore() {
    return Expanded(
      flex: 45,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Different number:",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "You score runs",
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            _positionedHand(
              isReversed: true,
              animation: 'Three',
              offset: const Offset(30, 30),
            ),
            _positionedHand(
              isReversed: false,
              animation: 'One',
              offset: const Offset(30, -6),
              alignBottom: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStepThree() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _stepIndicator('3'),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              "Be the highest scorer \n& win signed RCB merch",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Image.asset(Assets.rcbMerchImage, height: 50, width: 50),
        ],
      ),
    );
  }

  Widget _stepIndicator(String number) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(top: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          stops: [0, 0.2, 1],
          colors: [Colors.red, Colors.red, Colors.black87],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.6),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Text(
        number,
        style: TextStyle(
          color: Colors.amber.shade300,
          fontWeight: FontWeight.w900,
          height: 0,
        ),
      ),
    );
  }

  static Widget _positionedHand({
    required bool isReversed,
    required String animation,
    required Offset offset,
    bool alignBottom = false,
  }) {
    return Positioned(
      right: offset.dx,
      top: alignBottom ? null : offset.dy,
      bottom: alignBottom ? offset.dy : null,
      child: Transform(
        alignment: alignBottom ? Alignment.bottomCenter : Alignment.center,
        transform:
            Matrix4.identity()
              ..rotateZ(alignBottom ? 0.8 : -0.8)
              ..rotateY(isReversed ? 3.1416 : 0),
        child: SizedBox(
          height: 150,
          width: 150,
          child: rive.RiveAnimation.asset(
            Assets.riveFile,
            animations: [animation],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
