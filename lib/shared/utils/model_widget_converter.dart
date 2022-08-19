import 'package:flutter/material.dart';
import 'package:modula_notes/models/note_widget_model.dart';
import 'package:modula_notes/models/text_widget_note_model.dart';
import 'package:modula_notes/models/todo_widget_note_model.dart';
import 'package:modula_notes/shared/widgets/note_widgets/editable_note_widget.dart';
import 'package:modula_notes/shared/widgets/note_widgets/editable_text_note_widget.dart';
import 'package:modula_notes/shared/widgets/note_widgets/editable_todo_note_widget.dart';
import 'package:modula_notes/shared/widgets/note_widgets/text_note_widget.dart';
import 'package:modula_notes/shared/widgets/note_widgets/todo_note_widget.dart';

class ModelWidgetConverter {
  static List<Widget> createRenderedNotesWidget(
      List<NoteWidgetModel> notesWidgets) {
    List<Widget> noteWidgetsRendered = List.empty(growable: true);

    for (var model in notesWidgets) {
      if (model is TodoWidgetNoteModel) {
        noteWidgetsRendered.add(TodoNoteWidget(model));
      } else {
        noteWidgetsRendered.add(TextNoteWidget(
          model as TextWidgetNoteModel,
        ));
      }
    }

    return noteWidgetsRendered;
  }

  static List<EditableNoteWidget> createRenderedEditableNotesWidgets(
      List<NoteWidgetModel> noteWidgets,
      {void Function(DismissDirection, Key)? onDismiss}) {
    List<EditableNoteWidget> noteWidgetsRendered = List.empty(growable: true);

    int count = 0;
    for (var model in noteWidgets) {
      if (model is TodoWidgetNoteModel) {
        Key dismissableKey = ValueKey(noteWidgets);
        Key widgetListKey = ValueKey(count);
        noteWidgetsRendered.add(EditableTodoNoteWidget(
          model,
          key: widgetListKey,
          dismissableItemKey: dismissableKey,
          onDismissed: onDismiss,
        ));
      } else {
        Key dismissableKey = ValueKey(model);
        Key widgetListKey = ValueKey(count);
        noteWidgetsRendered.add(EditableTextNoteWidget(
          model as TextWidgetNoteModel,
          key: widgetListKey,
          dismissableItemKey: dismissableKey,
          onDismissed: onDismiss,
        ));
      }

      count++;
    }

    return noteWidgetsRendered;
  }
}
