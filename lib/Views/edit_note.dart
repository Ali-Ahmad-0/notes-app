import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../cubits/notes_cubit/notes_cubit.dart';
import '../models/note_model.dart';
import '../widgets/color_item.dart' show Color_item;
import '../widgets/customAppBar.dart';
import '../widgets/custom_Text_Field.dart';

class EditNoteview extends StatefulWidget {
  const EditNoteview({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditNoteview> createState() => _EditNoteviewState();
}

class _EditNoteviewState extends State<EditNoteview> {
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: ListView(
          children: [
            CustomAppBar(
              onPressed: () {
                widget.noteModel.title = title ?? widget.noteModel.title;
                widget.noteModel.subTitle =
                    subtitle ?? widget.noteModel.subTitle;

                widget.noteModel.save();
                Navigator.pop(context);
                BlocProvider.of<NoteCubit>(context).fetchAllnotes();
              },
              title: Text(
                'Edit note',
                style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'Times',
                    fontWeight: FontWeight.bold),
              ),
              icon: Icons.check,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              text: 'Title',
              content: widget.noteModel.title ?? 'Title',
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              text: 'Content',
              content: widget.noteModel.subTitle ?? 'Content',
              onChanged: (value) {
                subtitle = value;
              },
              maxLines: 5,
            ),
            SizedBox(
              height: 20,
            ),
            EditNoteColor(
              noteModel: widget.noteModel,
            ),
            SvgPicture.asset(
              height: 300,
              'Assets/images/note.svg',
            )
          ],
        ),
      ),
    );
  }
}

class EditNoteColor extends StatefulWidget {
  final NoteModel noteModel;
  const EditNoteColor({super.key, required this.noteModel});

  @override
  State<EditNoteColor> createState() => _EditNoteColorState();
}

class _EditNoteColorState extends State<EditNoteColor> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kcolorsList.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

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
                widget.noteModel.color = kcolorsList[index].value;
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
