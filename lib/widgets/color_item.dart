import 'package:flutter/material.dart';

class Color_item extends StatelessWidget {
  const Color_item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}
