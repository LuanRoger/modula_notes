import 'package:modula_notes/models/enum/note_widget_types.dart';

import 'note_widget_model.dart';

class ImageWidgetNoteModel implements NoteWidgetModel {
  @override
  NoteWidgetType type = NoteWidgetType.Image;

  @override
  String value = "";

  ImageWidgetNoteModel(this.value);

  @override
  Map<String, Object> toMap() => {"value": value, "type": type.index};
  static ImageWidgetNoteModel fromMap(Map<String, Object?> map) =>
      ImageWidgetNoteModel(map["value"] as String);
}
