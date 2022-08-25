import 'package:flutter/material.dart';
import 'package:modula_notes/models/note_model.dart';
import 'package:modula_notes/shared/widgets/note_preview.dart';

class ViewNotePage extends StatelessWidget {
  final NoteModel noteModel;

  const ViewNotePage(this.noteModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(noteModel.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NotePreview(
          noteModel.noteWidgets,
          scrollable: true,
        ),
      ),
    );
  }
}
