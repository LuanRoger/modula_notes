import 'package:modula_notes/shared/widgets/note_widgets/editable_note_widget.dart';
import 'package:modula_notes/shared/widgets/note_widgets/editable_text_note_widget.dart';
import 'package:modula_notes/shared/widgets/note_widgets/editable_todo_note_widget.dart';

class NoteWidgetCast {
  EditableNoteWidget? castToEditableNoteWidget(EditableNoteWidget widget) {
    if (widget.runtimeType is EditableTodoNoteWidget) {
      return widget as EditableTodoNoteWidget;
    }

    return widget as EditableTextNoteWidget;
  }
}
