import 'package:notes_app/models/note_model.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {
  final List<NoteModel> notes;

  NotesSuccess(this.notes);
}

class NotesLoading extends NotesState {}

class NotesFailure extends NotesState {
  final String error;
  NotesFailure(this.error);
}
