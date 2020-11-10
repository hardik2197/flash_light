import 'package:flutter/material.dart';

class LampSwitchRope extends StatelessWidget {
  final double screenWidth, screenHeight;
  final Color color;
  final bool isSwitchOn;
  final Duration animationDuration;

  const LampSwitchRope({
    this.screenWidth,
    this.screenHeight,
    this.color,
    this.isSwitchOn,
    this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: screenHeight * 0.4,
      bottom: screenHeight * (isSwitchOn ? 0.34 : 0.38),
      right: screenWidth * 0.5 - 1,
      width: 2,
      duration: animationDuration,
      child: Container(
        color: color,
      ),
    );
  }
}
