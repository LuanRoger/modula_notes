import 'package:flutter/material.dart';
import 'package:my_notes/models/text_widget_note_model.dart';
import 'package:my_notes/shared/app_text_style.dart';

class TextNoteWidget extends StatelessWidget {
  TextWidgetNoteModel textWidgetNoteModel;
  TextStyle? textStyle;

  TextNoteWidget(this.textWidgetNoteModel, {Key? key, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textWidgetNoteModel.value,
      style: textStyle ?? AppTextStyle.NOTE_PREVIEW_TEXT_WIDGET,
    );
  }
}
