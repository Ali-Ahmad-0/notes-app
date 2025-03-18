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
          child: AddFormField(),
        ),
      ),
    );
  }
}

class AddFormField extends StatefulWidget {
  const AddFormField({
    super.key,
  });

  @override
  State<AddFormField> createState() => _AddFormFieldState();
}

class _AddFormFieldState extends State<AddFormField> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onsaved: (value) {
              title = value;
            },
            content: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onsaved: (value) {
              subTitle = value;
            },
            content: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 120,
          ),
          CustomButton(
            ontap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {
                  
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
