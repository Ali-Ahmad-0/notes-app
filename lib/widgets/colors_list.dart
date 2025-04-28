import 'package:flutter/material.dart' show StatelessWidget;
import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/add_form_field.dart';
import 'package:notes_app/widgets/color_item.dart';

class Colors_list extends StatelessWidget {
  const Colors_list({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Color_item();
        });
  }
}