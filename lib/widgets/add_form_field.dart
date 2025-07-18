import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../models/note_model.dart';
import 'colors_list.dart';
import 'custom_Text_Field.dart';
import 'custom_button.dart';

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
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onsaved: (value) {
              title = value;
            },
            text: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onsaved: (value) {
              subTitle = value;
            },
            // content: 'Content',
            text: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 30,
          ),
          Colors_list(),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isloading: state is AddNoteLoading ? true : false,
                ontap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();

                    var noteModel = NoteModel(
                        color: Colors.indigo.value,
                        date: DateTime.now().toString(),
                        title: title!,
                        subTitle: subTitle!);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Note added successfully ✅",
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;

                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
