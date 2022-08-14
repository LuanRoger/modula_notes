import 'package:my_notes/models/enum/note_widget_types.dart';

abstract class NoteWidgetModel {
  String value;
  NoteWidgetType type;

  NoteWidgetModel(this.value, {required this.type});

  Map<String, Object> toMap();
}
