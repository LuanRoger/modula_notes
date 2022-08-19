import 'package:flutter/material.dart';
import 'package:modula_notes/models/note_model.dart';
import 'package:modula_notes/shared/widgets/note_grid_preview.dart';

class NotesGrid extends StatelessWidget {
  final List<NoteModel> notes;

  const NotesGrid({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => NoteGridPreview(
        notes[index],
        indexForHero: index,
      ),
      itemCount: notes.length,
    );
  }
}
