import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/assets.dart';
import 'package:rive/rive.dart';

class HandAnimation extends StatefulWidget {
  const HandAnimation({super.key, required this.handIndex});
  final int handIndex;

  @override
  State<HandAnimation> createState() => _HandAnimationState();
}

class _HandAnimationState extends State<HandAnimation> {
  StateMachineController? _controller;
  SMIInput<double>? _handIndex;

  void riveInit(Artboard artboard) {
    _controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );
    if (_controller != null) {
      artboard.addController(_controller!);
      _handIndex = _controller?.findInput<double>('Input');
      _handIndex?.value = widget.handIndex.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
