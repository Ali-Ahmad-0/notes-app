import 'package:flutter/material.dart' show StatelessWidget;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/add_form_field.dart';
import 'package:notes_app/widgets/color_item.dart';

class Colors_list extends StatefulWidget {
  
  const Colors_list({super.key,});

  @override
  State<Colors_list> createState() => _Colors_listState();
}

class _Colors_listState extends State<Colors_list> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          itemCount: kcolorsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<AddNoteCubit>(context).noteColor =
                    kcolorsList[index];
                currentIndex = index;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Color_item(
                  isActivated: currentIndex == index,
                  colorItem: kcolorsList[index],
                ),
              ),
            );
          }),
    );
  }
}
