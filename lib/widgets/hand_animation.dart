import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:hand_cricket/utils/assets.dart';

class HandAnimation extends StatefulWidget {
  final int handIndex;
  const HandAnimation({super.key, required this.handIndex});

  @override
  State<HandAnimation> createState() => _HandAnimationState();
}

class _HandAnimationState extends State<HandAnimation> {
  StateMachineController? _controller;
  SMIInput<double>? _handInput;

  void riveInit(Artboard artboard) {
    _controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );
    if (_controller != null) {
      artboard.addController(_controller!);
      _handInput = _controller?.findInput<double>('Input');

      _playHand(widget.handIndex);
    }
  }

  void _playHand(int index) {
    final val = index.toDouble();
    _handInput?.value = val == 1 ? 0 : val - 1;

    Future.delayed(const Duration(milliseconds: 2), () {
      _handInput?.value = val;
    });
  }

  @override
  void didUpdateWidget(covariant HandAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    _playHand(widget.handIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 160,
      child: RiveAnimation.asset(
        Assets.riveFile,
        stateMachines: ["State Machine 1"],
        onInit: riveInit,
      ),
    );
  }
}
