import 'package:flutter/material.dart';

import 'Note_Card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return const NoteCard();
    });
  }
}
