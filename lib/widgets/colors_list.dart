import 'package:flutter/material.dart' show StatelessWidget;
import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/add_form_field.dart';
import 'package:notes_app/widgets/color_item.dart';

class Colors_list extends StatefulWidget {
  const Colors_list({
    super.key,
  });

  @override
  State<Colors_list> createState() => _Colors_listState();
}

class _Colors_listState extends State<Colors_list> {
  List<Color> colorsList = [
    Color(0xff5FD0D3),
    Color(0xffFF7B6B),
    Color(0xff6FFFA3),
    Color(0xffFF9AAC),
    Color(0xffFFD972),
    Color(0xff77BFF8),
    Color(0xffD6A4FF),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          itemCount: colorsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Color_item(
                  isActivated: currentIndex == index,
                  colorItem: colorsList[index],
                ),
              ),
            );
          }),
    );
  }
}
