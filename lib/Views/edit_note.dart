import 'package:flutter/material.dart';
import 'package:notes_app/widgets/customAppBar.dart';
import 'package:notes_app/widgets/custom_Text_Field.dart';

class EditNoteview extends StatelessWidget {
  const EditNoteview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          children: [
            const CustomAppBar(
              title: 'Edit note',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(content: 'Title'),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              content: 'Content',
              maxLines: 5,
            )
          ],
        ),
      ),
    );
  }
}
