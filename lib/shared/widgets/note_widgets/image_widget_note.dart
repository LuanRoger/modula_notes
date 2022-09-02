import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modula_notes/models/image_widget_note_model.dart';

class ImageWidgetNote extends StatelessWidget {
  final ImageWidgetNoteModel noteModel;

  const ImageWidgetNote(this.noteModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(noteModel.value),
      fit: BoxFit.scaleDown,
      alignment: Alignment.topCenter,
    );
  }
}
