import 'package:flutter/material.dart';

class Color_item extends StatelessWidget {
  Color_item({
    super.key,
    required this.colorItem,
    required this.isActivated,
  });
  final Color colorItem;
  final bool isActivated;
  @override
  Widget build(BuildContext context) {
    return isActivated
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: colorItem,
            ),
          )
        : CircleAvatar(
            radius: 30,
            backgroundColor: colorItem,
          );
  }
}
