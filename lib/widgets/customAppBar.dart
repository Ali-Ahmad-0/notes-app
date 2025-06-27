import 'package:flutter/material.dart';
import 'Custom_Icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, this.onPressed, required this.title, required this.icon});
  final Widget title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       title,
        //   const Spacer(),
        CustomIcon(
          onPressed: onPressed,
          icon: icon,
        )
      ],
    );
  }
}
