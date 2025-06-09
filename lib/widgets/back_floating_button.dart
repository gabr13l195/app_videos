import 'package:flutter/material.dart';

class BackFloatingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;

  const BackFloatingButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 16,
      child: FloatingActionButton(
        heroTag: 'backButton',
        onPressed: onPressed ?? () => Navigator.pop(context),
        backgroundColor: backgroundColor ?? Colors.white,
        mini: true,
        child: Icon(
          Icons.arrow_back,
          color: iconColor ?? Colors.black,
        ),
      ),
    );
  }
} 