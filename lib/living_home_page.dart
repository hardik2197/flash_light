import 'package:flutter/material.dart';
import 'package:smart_home/lamp_switch.dart';
import 'package:torch_compat/torch_compat.dart';

import 'lamp.dart';
import 'lamp_hanger_rope.dart';
import 'lamp_swith_rope.dart';
import 'led_bulb.dart';

final darkGray = Color(0xff232323);
final bulbOnColor = Color(0xffffe12c);
final bulbOffColor = Color(0xffc1c1c1);
final animationDuration = Duration(milliseconds: 500);

class LivingHomePage extends StatefulWidget {
  @override
  _LivingHomePageState createState() => _LivingHomePageState();
}

class _LivingHomePageState extends State<LivingHomePage> {
  var _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Color(0xffc1c1c1),
      body: Stack(
        children: [
          LampHangerRope(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: darkGray),
          LedBulb(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            onColor: bulbOnColor,
            offColor: bulbOffColor,
            isSwitchOn: _isSwitchOn,
          ),
          Lamp(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            color: darkGray,
            isSwitchOn: _isSwitchOn,
            gradientColor: bulbOnColor,
            animationDuration: animationDuration,
          ),
          LampSwitch(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            toggleOnColor: bulbOnColor,
            toggleOffColor: bulbOffColor,
            color: darkGray,
            isSwitchOn: _isSwitchOn,
            animationDuration: animationDuration,
            onTap: () {
              if (_isSwitchOn) {
                TorchCompat.turnOff();
              } else {
                TorchCompat.turnOn();
              }

              setState(() {
                _isSwitchOn = !_isSwitchOn;
              });
            },
          ),
          LampSwitchRope(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            color: darkGray,
            isSwitchOn: _isSwitchOn,
            animationDuration: animationDuration,
          ),
        ],
      ),
    );
  }
}
