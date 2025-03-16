import 'package:flutter/material.dart';
import 'package:notes_app/widgets/customAppBar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          children: [CustomAppBar(), Expanded(child: NotesListView())],
        ),
      ),
    );
  }
}
