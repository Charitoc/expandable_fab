import 'package:flutter/material.dart';

class CentralFloatingActionButton extends StatefulWidget {
  const CentralFloatingActionButton({
    super.key,
    required this.toggleElevatedButton,
    required this.isExpanded,
    required this.animationControllerDuration,
    required this.minimizedColor,
    required this.expandedColor,
    required this.expandedIcon,
    required this.minimizedIcon,
    required this.size,
  });

  final VoidCallback toggleElevatedButton;
  final bool isExpanded;
  final Duration animationControllerDuration;
  final Color minimizedColor;
  final Color expandedColor;
  final IconData? expandedIcon;
  final IconData? minimizedIcon;

  final double size;

  @override
  State<CentralFloatingActionButton> createState() =>
      _CentralFloatingActionButtonState();
}

class _CentralFloatingActionButtonState
    extends State<CentralFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationControllerDuration,
    );
    _colorTween =
        ColorTween(begin: widget.minimizedColor, end: widget.expandedColor)
            .animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => FloatingActionButton(
        shape: const CircleBorder(),
        heroTag: widget.hashCode,
        backgroundColor: _colorTween.value,
        onPressed: () {
          widget.toggleElevatedButton();
          if (widget.isExpanded) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
        },
        child: AnimatedSwitcher(
          transitionBuilder: (child, anim) => RotationTransition(
            turns: child.key == const ValueKey('initialValue')
                ? Tween<double>(begin: 1, end: 0).animate(anim)
                : Tween<double>(begin: 0, end: 1).animate(anim),
            child: FadeTransition(opacity: anim, child: child),
          ),
          duration: widget.animationControllerDuration,
          child: widget.isExpanded
              ? Icon(widget.expandedIcon, key: const ValueKey('initialValue'))
              : Icon(
                  widget.minimizedIcon,
                  key: const ValueKey('newValue'),
                ),
        ),
      ),
    );
  }
}
