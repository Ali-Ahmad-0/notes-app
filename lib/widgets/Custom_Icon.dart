import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
