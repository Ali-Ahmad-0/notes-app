import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart' show NotesState;
import 'package:notes_app/models/note_model.dart' show NoteModel;
import 'package:notes_app/widgets/Note_Card.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});
  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.indigo,
                    ),
                    child: Center(
                      child: Text('Edit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  key: ValueKey(
                    notes[index],
                  ),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
