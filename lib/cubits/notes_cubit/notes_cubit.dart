import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
//import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';

import 'notes_states.dart';

//part of 'notes_cubit.dart';
class NoteCubit extends Cubit<NotesState> {
  NoteCubit() : super(NotesInitial());

  fetchAllnotes () async{

    try {
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      emit(NotesSuccess(notesBox.values.toList()));
    }  catch (e) {
      emit(NotesFailure( e.toString()));
    }
  }
  }
  
  class NoteInitial {
  }



