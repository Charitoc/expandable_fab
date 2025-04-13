import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
    required this.isExpanded,
    required this.animationDuration,
  });

  final bool isExpanded;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isExpanded,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedOpacity(
          opacity: isExpanded ? 1.0 : 0.0,
          duration: animationDuration,
          curve: Curves.decelerate,
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.grey.shade900.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
