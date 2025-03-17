import 'package:flutter/material.dart';
import 'package:notes_app/widgets/search_Icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title,  required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 70,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        Spacer(),
        SearchIcon(icon: icon,)
      ],
    );
  }
}
