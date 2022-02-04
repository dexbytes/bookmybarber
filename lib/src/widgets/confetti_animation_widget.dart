/*

import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class AllConfettiWidget extends StatefulWidget {
  final Widget child;
  final stopCallBack;

  const AllConfettiWidget({
    @required this.child,
    Key key, this.stopCallBack,
  }) : super(key: key);
  @override
  _AllConfettiWidgetState createState() => _AllConfettiWidgetState();
}

class _AllConfettiWidgetState extends State<AllConfettiWidget> {
  ConfettiController controller;

  @override
  void initState() {
    super.initState();

    controller = ConfettiController(duration: Duration(seconds: 5));
    controller.play();
    controller.addListener(() {
      if(controller.state == ConfettiControllerState.stopped) {
        widget.stopCallBack?.call();
      }
    });
  }

  //static final double right = 0;
  static final double down = pi / 2;
//  static final double left = pi;
//  static final double top = -pi / 2;

  final double blastDirection = down;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (controller.state == ConfettiControllerState.playing) {
          controller.stop();
        }else {
          controller.play();
        }
      },
      child: Stack(
        children: [
          widget.child,
          buildConfetti(),
        ],
      ),
    );
  }

  Widget buildConfetti() => Align(
    alignment: Alignment.center,
    child: ConfettiWidget(
      confettiController: controller,
      colors: [
        Colors.orange,
        Colors.purple,
        Colors.pink,
      ],
      blastDirection: blastDirection,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: false,
      emissionFrequency: 0.1,
      numberOfParticles: 15,
      gravity: 0.1,
      maxBlastForce: 5,
      minBlastForce: 1,
      particleDrag: 0.010,
      maximumSize: Size(5,15),
      minimumSize: Size(5,15),
    ),
  );
}*/
