import 'package:modula_notes/models/enum/note_widget_types.dart';
import 'package:modula_notes/models/note_widget_model.dart';

class TodoWidgetNoteModel implements NoteWidgetModel {
  bool done;
  @override
  String value;
  @override
  NoteWidgetType type = NoteWidgetType.Todo;

  TodoWidgetNoteModel(this.done, this.value);

  @override
  Map<String, Object> toMap() =>
      {"value": value, "done": done, "type": type.index};

  static TodoWidgetNoteModel fromMap(Map<String, Object?> map) =>
      TodoWidgetNoteModel(map["done"] as bool, map["value"] as String);
}
