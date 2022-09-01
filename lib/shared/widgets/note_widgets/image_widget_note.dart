import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modula_notes/models/image_widget_note_model.dart';

class ImageWidgetNote extends StatelessWidget {
  final ImageWidgetNoteModel noteModel;
  final double? height;
  final double? width;

  const ImageWidgetNote(this.noteModel, {super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(noteModel.value),
      width: width,
      height: height,
    );
  }
}
