import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/Views/edit_note.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color(note.color), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              note.title,
              style: const TextStyle(color: Colors.black, fontSize: 27),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                note.subTitle,
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return EditNoteview(
                      noteModel: note,
                    );
                  }),
                );
              },
              icon: const Icon(
                FontAwesomeIcons.edit,
                color: Colors.black,
                size: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 15, bottom: 10),
            child: Text(
              note.date.substring(0, 10),
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}
