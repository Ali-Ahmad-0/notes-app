import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_Text_Field.dart';

import 'custom_button.dart';

class AddNoteBottomsheet extends StatelessWidget {
  const AddNoteBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                content: 'Title',
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                content: 'Content',
                maxLines: 5,
              ),
              SizedBox(
                height: 120,
              ),
              CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}

