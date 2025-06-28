import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import '../cubits/notes_cubit/notes_states.dart';
import '../models/note_model.dart';
import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/customAppBar.dart';
import '../widgets/notes_view_body.dart';

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

  Widget buildNotesList() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
          itemCount: isSearching ? filteredNotes.length : allnotes.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                child: Center(
                  child: Text(
                    'Delete',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                color: Colors.red,
              ),
              key: Key(isSearching
                  ? filteredNotes[index].title
                  : allnotes[index].title),
              confirmDismiss: (direction) async {
                return await showDialog(
                    context: context,
                    builder: (context) {
                      return Stack(children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 30),
                          child: Container(
                              color: const Color.fromARGB(255, 94, 94, 94)
                                  .withOpacity(0.3)),
                        ),
                        AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: const Color(0xff151515),
                          title: Row(
                            children: [
                              Icon(Icons.warning,
                                  color: Colors.deepOrangeAccent,
                                  size:
                                      MediaQuery.of(context).size.width * 0.09),
                              SizedBox(width: 8),
                              Text(
                                'Confirm Deletion',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ],
                          ),
                          content: Text(
                            'This note will be permanently deleted.\nDo you really want to proceed?',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045),
                          ),
                          actionsPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          actions: [
                            TextButton.icon(
                              onPressed: () => Navigator.of(context).pop(true),
                              icon: const Icon(Icons.delete_forever,
                                  color: Colors.red),
                              label: const Text(
                                'Delete',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                      ]);
                    });
              },
              onDismissed: (DismissDirection direction) {
                isSearching
                    ? filteredNotes[index].delete()
                    : allnotes[index].delete();
                BlocProvider.of<NoteCubit>(context).fetchAllnotes();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Note deleted 🗑️"),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
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
          icon: Icon(Icons.search_rounded, color: Colors.white, size: 42),
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
        backgroundColor: const Color.fromARGB(200, 0, 0, 0),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
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
