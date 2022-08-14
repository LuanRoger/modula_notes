import 'package:flutter/material.dart';
import 'package:my_notes/models/note_model.dart';
import 'package:my_notes/shared/widgets/note_preview.dart';

class ViewNotePage extends StatelessWidget {
  NoteModel noteModel;
  final String tagForHero;

  ViewNotePage(this.noteModel, {Key? key, required this.tagForHero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(noteModel.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          flex: 0,
          child: Hero(
            tag: tagForHero,
            child: Material(
              type: MaterialType.transparency,
              child: NotePreview(
                noteModel.noteWidgets,
                scrollable: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
