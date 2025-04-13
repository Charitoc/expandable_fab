import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CentralFABData extends Equatable {
  const CentralFABData({
    this.color = Colors.blue,
    this.expandedColorForCentralButton = Colors.blue,
    this.minimizedIcon,
    this.expandedIcon,
    this.text,
    required this.onTap,
    this.size = 40,
  });

  final Color color;
  final Color expandedColorForCentralButton;

  final IconData? minimizedIcon;
  final IconData? expandedIcon;

  final String? text;
  final VoidCallback onTap;
  final double size;

  @override
  List<Object?> get props => [
        color,
        minimizedIcon,
        expandedIcon,
        text,
        onTap,
        size,
      ];
}
