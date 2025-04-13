// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expandable_fab_animated/expandable_fab_animated.dart';
import 'package:flutter/material.dart';

class ActionButtonView extends StatefulWidget {
  const ActionButtonView({
    super.key,
    required this.centralButton,
    required this.buttonList,
    required this.animationDuration,
    required this.distanceFromBottom,
    required this.distanceFromRightSide,
    required this.distanceBetweenButtons,
  });

  final CentralFABData centralButton;
  final List<FABData> buttonList;
  final Duration animationDuration;
  final double distanceFromBottom;
  final double distanceFromRightSide;
  final double distanceBetweenButtons;

  @override
  State<ActionButtonView> createState() => _ActionButtonViewState();
}

class _ActionButtonViewState extends State<ActionButtonView>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleElevatedButton() {
    if (_animationController.status == AnimationStatus.reverse ||
        _animationController.status == AnimationStatus.dismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Background(
          isExpanded: isExpanded,
          animationDuration: widget.animationDuration,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.distanceFromRightSide,
            vertical: widget.distanceFromBottom,
          ),
          child: ExpandableFloatingActionButton(
            isExpanded: isExpanded,
            toggleElevatedButton: toggleElevatedButton,
            buttonList: widget.buttonList,
            animationDuration: widget.animationDuration,
            distanceBetweenButtons: widget.distanceBetweenButtons,
            centralButton: widget.centralButton,
            distanceFromRightSide: widget.distanceFromRightSide,
            animationController: _animationController,
          ),
        ),
      ],
    );
  }
}
