import 'package:flutter/material.dart';
import 'package:notes_app/widgets/customAppBar.dart';

class EditNoteview extends StatelessWidget {
  const EditNoteview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          children: [CustomAppBar( title: 'Edit note' , icon: Icons.check,)],
        ),
      ),
    );
  }
}
