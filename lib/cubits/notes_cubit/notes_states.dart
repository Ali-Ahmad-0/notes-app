import '../../models/note_model.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {
  final List<NoteModel> notes;

  NotesSuccess({required this.notes});

}

class NotesLoading extends NotesState {}
