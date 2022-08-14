import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/models/note_widget_model.dart';
import 'package:my_notes/shared/utils/model_widget_converter.dart';

class NotePreview extends StatelessWidget {
  List<NoteWidgetModel> noteWidgets;
  late List<Widget> renderedWidgets;
  bool scrollable;

  NotePreview(this.noteWidgets, {Key? key, this.scrollable = false}) : super(key: key) {
    renderedWidgets =
        ModelWidgetConverter.createRenderedNotesWidget(noteWidgets);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: scrollable ? null : const NeverScrollableScrollPhysics(),
      children: renderedWidgets,
    );
  }
}
