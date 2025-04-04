import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/customAppBar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return const AddNoteBottomsheet();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey.shade900,
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomAppBar(
              title: 'Notes',
              icon: Icons.search,
            ),
            Expanded(child: NotesListView())
          ],
        ),
      ),
    );
  }
}
