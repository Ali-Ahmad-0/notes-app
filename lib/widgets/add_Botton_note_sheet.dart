import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/widgets/add_form_field.dart';

class AddNoteBottomsheet extends StatelessWidget {
  const AddNoteBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteFailure) {
                print('Failed ! ${state.errorMessage}');
              }
              if (state is AddNoteSuccess) {
                Navigator.pop(context);
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              return ModalProgressHUD(
                  inAsyncCall: state is AddNoteLoading ? true : false,
                  child: AddFormField());
            },
          ),
        ),
      ),
    );
  }
}
