import 'package:egyption_foods/constants/colors.dart';
import 'package:egyption_foods/constants/extensions.dart';
import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  final String tag;
  final Widget child;

  const HeroWidget({required this.tag, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(tag: tag, child: Card(elevation: 0, margin: 0.edgeInsetsAll, color: AppColors.transparentColor, child: child));
  }
}
