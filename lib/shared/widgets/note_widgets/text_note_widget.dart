import 'package:flutter/material.dart';
import 'package:modula_notes/models/text_widget_note_model.dart';
import 'package:modula_notes/shared/app_text_style.dart';

class TextNoteWidget extends StatelessWidget {
  final TextWidgetNoteModel textWidgetNoteModel;
  final TextStyle? textStyle;

  const TextNoteWidget(this.textWidgetNoteModel, {Key? key, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textWidgetNoteModel.value,
      style: textStyle ?? AppTextStyle.NOTE_PREVIEW_TEXT_WIDGET,
    );
  }
}
