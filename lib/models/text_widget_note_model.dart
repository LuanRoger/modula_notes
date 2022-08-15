import 'package:my_notes/models/enum/note_widget_types.dart';
import 'package:my_notes/models/note_widget_model.dart';

class TextWidgetNoteModel implements NoteWidgetModel {
  @override
  String value;
  @override
  NoteWidgetType type = NoteWidgetType.Text;

  TextWidgetNoteModel(this.value);

  @override
  Map<String, Object> toMap() => {"value": value, "type": type.index};

  static TextWidgetNoteModel fromMap(Map<String, Object?> map) =>
      TextWidgetNoteModel(map["value"] as String);
}
