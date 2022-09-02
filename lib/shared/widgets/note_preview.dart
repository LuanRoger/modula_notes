import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modula_notes/models/note_widget_model.dart';
import 'package:modula_notes/shared/utils/model_widget_converter.dart';

class NotePreview extends StatelessWidget {
  final List<NoteWidgetModel> noteWidgets;
  late final List<Widget> renderedWidgets;
  final bool scrollable;

  NotePreview(this.noteWidgets, {Key? key, this.scrollable = false})
      : super(key: key) {
    renderedWidgets =
        ModelWidgetConverter.createRenderedNotesWidget(noteWidgets);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: scrollable ? null : const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: renderedWidgets,
    );
  }
}
