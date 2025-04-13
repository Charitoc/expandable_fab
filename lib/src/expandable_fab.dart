import 'package:expandable_fab_animated/expandable_fab_animated.dart';
import 'package:flutter/material.dart';

class ExpandableFloatingActionButton extends StatefulWidget {
  const ExpandableFloatingActionButton({
    super.key,
    required this.isExpanded,
    required this.toggleElevatedButton,
    required this.centralButton,
    required this.buttonList,
    required this.animationDuration,
    required this.distanceBetweenButtons,
    required this.distanceFromRightSide,
    required this.animationController,
  });

  final bool isExpanded;
  final VoidCallback toggleElevatedButton;
  final CentralFABData centralButton;
  final List<FABData> buttonList;
  final Duration animationDuration;
  final double distanceBetweenButtons;
  final double distanceFromRightSide;
  final AnimationController animationController;

  @override
  State<ExpandableFloatingActionButton> createState() =>
      _ExpandableFloatingActionButtonState();
}

class _ExpandableFloatingActionButtonState
    extends State<ExpandableFloatingActionButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
          ),
          IgnorePointer(
            ignoring: !widget.isExpanded,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 78,
              ),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: widget.buttonList.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: widget.distanceBetweenButtons,
                ),
                itemBuilder: (context, index) => Row(
                  children: [
                    const Spacer(),
                    SubCategoryElevatedButton(
                      distanceFromRightSide: widget.distanceFromRightSide,
                      index: widget.buttonList.length - index,
                      onTap: () {
                        widget.buttonList[index].onTap();
                        widget.toggleElevatedButton();
                      },
                      icon: widget.buttonList[index].icon,
                      text: widget.buttonList[index].text,
                      animationController: widget.animationController,
                      color: widget.buttonList[index].color,
                      animationControllerDuration: widget.animationDuration,
                      size: widget.buttonList[index].size,
                    ),
                  ],
                ),
              ),
            ),
          ),
          CentralFloatingActionButton(
            minimizedColor: widget.centralButton.color,
            expandedColor: widget.centralButton.expandedColorForCentralButton,
            size: widget.centralButton.size,
            animationControllerDuration: widget.animationDuration,
            expandedIcon: widget.centralButton.expandedIcon,
            minimizedIcon: widget.centralButton.minimizedIcon,
            toggleElevatedButton: () => widget.toggleElevatedButton(),
            isExpanded: widget.isExpanded,
          ),
        ],
      ),
    );
  }
}
