import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/customAppBar.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../widgets/Note_Card.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  bool isSearching = false;
  final textController = TextEditingController();
  List<NoteModel> filteredNotes = [];
  late List<NoteModel> allnotes;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NoteCubit>(context).fetchAllnotes();
  }

  Widget blocBuilderWidget() {
    return BlocBuilder<NoteCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccess) {
          allnotes = state.notes;
          return buildNotesList();
        } else
          return Text('no data');
      },
    );
  }

  List listBuilder() {
    List<NoteModel> newNote = [];
    return isSearching ? newNote = filteredNotes : newNote = allnotes;
  }

  Widget buildNotesList() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
          itemCount: isSearching ? filteredNotes.length : allnotes.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                color: Colors.red,
              ),
              key: Key(isSearching
                  ? filteredNotes[index].title
                  : allnotes[index].title),
              // onDismissed: ,
              child: NoteItem(
                note: textController.text.isEmpty
                    ? allnotes[index]
                    : filteredNotes[index],
              ),
            );
          }),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      style: TextStyle(color: Colors.white, fontSize: 18),
      controller: textController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Find a note... ',
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        border: InputBorder.none,
      ),
      onChanged: (value) {
        filteredNotes = allnotes
            .where(
              (note) =>
                  note.title.toLowerCase().startsWith(value.toLowerCase()),
            )
            .toList();
        setState(() {});
      },
    );
  }

  List<Widget> appBarActions() {
    if (isSearching) {
      return [
        IconButton(
          icon: Icon(Icons.clear, size: 30, color: Colors.white),
          onPressed: () {
            setState(() {
              isSearching = false;
              Navigator.pop(context);
            });
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: Icon(Icons.search_rounded, color: Colors.white, size: 30),
          onPressed: () {
            ModalRoute.of(
              context,
            )!
                .addLocalHistoryEntry(
                    LocalHistoryEntry(onRemove: stopSearching));
            setState(() {
              isSearching = true;
            });
          },
        ),
      ];
    }
  }

  void stopSearching() {
    setState(() {
      isSearching = false;
      textController.clear();
    });
  }

  Widget buildAppbarTitle() {
    return Text(
      "Notes",
      style: TextStyle(
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'times',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151515),
      appBar: AppBar(
        backgroundColor: Color(0xff151515),
        title: isSearching ? buildSearchBar() : buildAppbarTitle(),
        actions: appBarActions(),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(221, 255, 255, 255),
        foregroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddNoteBottomsheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Expanded(child: blocBuilderWidget()),
      ),
    );
  }
}
