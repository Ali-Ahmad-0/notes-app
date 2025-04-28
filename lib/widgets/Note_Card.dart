import 'dart:ui';

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNoteview(
              noteModel: note,
            );
          }),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
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
                  showDialog(
                      context: context,
                      builder: (BuildContext builder) {
                        return Stack(children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 30),
                            child: Container(
                                color: const Color.fromARGB(255, 94, 94, 94)
                                    .withOpacity(0.3)),
                          ),
                          AlertDialog(
                            title: Text('Delete'),
                            content: Text(
                                'Are you sure you want to delete this note?'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    note.delete();
                                    BlocProvider.of<NoteCubit>(context)
                                        .fetchAllnotes();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'))
                            ],
                          ),
                        ]);
                      });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 45,
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
      ),
    );
  }
}
