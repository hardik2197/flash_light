import 'package:flutter/material.dart';

class LampSwitch extends StatelessWidget {
  final Function onTap;
  final bool isSwitchOn;
  final Color toggleOnColor, toggleOffColor, color;
  final double screenWidth, screenHeight;
  final Duration animationDuration;

  LampSwitch({
    this.onTap,
    this.isSwitchOn,
    this.screenWidth,
    this.screenHeight,
    this.animationDuration,
    this.toggleOnColor,
    this.toggleOffColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenHeight * 0.31,
      right: screenWidth * 0.5 - 15,
      width: 30,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: animationDuration,
              width: 30,
              height: 70,
              decoration: BoxDecoration(
                  color: isSwitchOn ? toggleOnColor : toggleOffColor,
                  borderRadius: BorderRadius.circular(15)),
            ),
            AnimatedPositioned(
              left: 0,
              right: 0,
              top: isSwitchOn ? 42 : 4,
              duration: animationDuration,
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            )
          ],
        ),
      ),
    );
  }
}
