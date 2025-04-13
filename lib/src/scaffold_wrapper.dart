import 'package:expandable_fab_animated/expandable_fab_animated.dart';
import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatelessWidget {
  const ScaffoldWrapper({
    super.key,
    required this.scaffoldToBeWrapped,
    required this.centralButton,
    required this.buttonList,
    this.distanceFromBottom = 24,
    this.distanceFromRightSide = 10,
    this.distanceBetweenButtons = 24,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  final Scaffold scaffoldToBeWrapped;
  final CentralFABData centralButton;
  final List<FABData> buttonList;
  final double distanceFromBottom;
  final double distanceFromRightSide;
  final double distanceBetweenButtons;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        scaffoldToBeWrapped,
        ScaffoldMessenger(
            key: key,
            child: ActionButtonView(
              buttonList: buttonList,
              distanceBetweenButtons: distanceBetweenButtons,
              distanceFromBottom: distanceFromBottom,
              distanceFromRightSide: distanceFromRightSide,
              animationDuration: animationDuration,
              centralButton: centralButton,
            ))
      ],
    );
  }
}
