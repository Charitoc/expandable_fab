import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FABData extends Equatable {
  const FABData({
    this.color = Colors.blue,
    this.expandedColorForCentralButton = Colors.blue,
    this.icon,
    this.text,
    this.size = 40,
    required this.onTap,
  });

  final Color color;
  final Color expandedColorForCentralButton;

  final Widget? icon;
  final String? text;
  final VoidCallback onTap;
  final double size;

  @override
  List<Object?> get props => [
        color,
        icon,
        text,
        onTap,
        size,
      ];
}
