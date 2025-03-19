import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_Text_Field.dart';
import 'package:notes_app/widgets/custom_button.dart';

class AddFormField extends StatefulWidget {
  const AddFormField({
    super.key,
  });

  @override
  State<AddFormField> createState() => _AddFormFieldState();
}

class _AddFormFieldState extends State<AddFormField> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
              if (formKey.currentState != null &&
                  formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
