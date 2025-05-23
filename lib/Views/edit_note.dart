import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/customAppBar.dart';
import 'package:notes_app/widgets/custom_Text_Field.dart';

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
              title: 'Edit note',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              content: 'Title',
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              content: 'Content',
              maxLines: 5,
              onChanged: (value) {
                subtitle = value;
              },
            ),
            SvgPicture.asset(
              'Assets/images/note.svg',
            )
          ],
        ),
      ),
    );
  }
}
