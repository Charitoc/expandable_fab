import 'package:flutter/material.dart';

class SubCategoryElevatedButton extends StatefulWidget {
  const SubCategoryElevatedButton({
    super.key,
    required this.onTap,
    this.icon,
    this.text,
    required this.index,
    required this.animationController,
    required this.color,
    required this.animationControllerDuration,
    required this.size,
    required this.distanceFromRightSide,
  });

  final VoidCallback onTap;
  final Widget? icon;
  final String? text;
  final int index;
  final AnimationController animationController;
  final Color color;
  final Duration animationControllerDuration;
  final double size;
  final double distanceFromRightSide;

  @override
  State<SubCategoryElevatedButton> createState() =>
      _SubCategoryElevatedButtonState();
}

class _SubCategoryElevatedButtonState extends State<SubCategoryElevatedButton>
    with SingleTickerProviderStateMixin {
  late Animation<int> _opacityTween;

  @override
  void initState() {
    _opacityTween =
        Tween<int>(begin: 0, end: 1).animate(widget.animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) => child!,
      child: AnimatedOpacity(
        opacity: _opacityTween.isForwardOrCompleted ? 1 : 0,
        duration: widget.animationControllerDuration,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.text != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.distanceFromRightSide,
                  ),
                  child: Material(
                    child: Text(
                      widget.text!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ),
              ),
            const SizedBox(
              width: 16,
            ),
            AnimatedContainer(
              // transform: Matrix4.identity()..translate(0.0, -25.0, 0.0),
              duration: widget.animationControllerDuration,
              padding: EdgeInsets.symmetric(
                  horizontal: widget.distanceFromRightSide),
              child: SizedBox(
                height: widget.size,
                width: widget.size,
                child: FloatingActionButton(
                  heroTag: widget.hashCode,
                  disabledElevation: 0,
                  backgroundColor: widget.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () => widget.onTap(),
                  child: widget.icon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
