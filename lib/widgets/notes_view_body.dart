import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/Note_Card.dart' show NoteItem;
import 'package:notes_app/widgets/customAppBar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  bool isSearching = false;
  final textController = TextEditingController();
  List<NoteModel> filteredNotes = [];
  late List<NoteModel> allnotes = [];
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).fetchAllnotes();
    super.initState();
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
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
          itemCount: allnotes.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return NoteItem(
              note: allnotes[index],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          isSearching
              ? CustomAppBar(
                  title: Text(
                    'Notes',
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Times',
                        fontWeight: FontWeight.bold),
                  ),
                  icon: Icons.search,
                )
              : CustomAppBar(title: buildSearchBar(), icon: Icons.clear),
          Expanded(child: buildNotesList())
        ]),
      ),
    );
  }
}
