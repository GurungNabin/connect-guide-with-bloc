import 'package:connect_guide/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton(
      {super.key, required this.onPressed, required this.title, this.height});

  final VoidCallback onPressed;
  final String title;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: AppColors.white),
      ),
    );
  }
}
