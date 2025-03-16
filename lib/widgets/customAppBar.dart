import 'package:flutter/material.dart';
import 'package:notes_app/widgets/search_Icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 70,
        ),
        Text(
          'Notes',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        Spacer(),
        SearchIcon()
      ],
    );
  }
}
