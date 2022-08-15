import 'package:my_notes/models/enum/note_widget_types.dart';
import 'package:my_notes/models/note_widget_model.dart';
import 'package:my_notes/models/text_widget_note_model.dart';
import 'package:my_notes/models/todo_widget_note_model.dart';
import 'package:my_notes/shared/utils/uuid_generator.dart';

class NoteModel {
  String uId;
  String title;
  List<NoteWidgetModel> noteWidgets;

  NoteModel(this.title, {required this.noteWidgets, required this.uId});

  factory NoteModel.newNote() => NoteModel("",
      noteWidgets: List.empty(growable: true), uId: UuIdGenerator.generateV4());

  factory NoteModel.fromMap(Map<String, Object?> map) {
    List<NoteWidgetModel> noteWidgetsFromMap = List.empty(growable: true);

    for (var widget in map["noteWidgets"] as List) {
      switch (NoteWidgetType.values[widget["type"] as int]) {
        case NoteWidgetType.Text:
          noteWidgetsFromMap.add(TextWidgetNoteModel.fromMap(widget));
          break;
        case NoteWidgetType.Todo:
          noteWidgetsFromMap.add(TodoWidgetNoteModel.fromMap(widget));
          break;
      }
    }

    return NoteModel(map["title"] as String,
        noteWidgets: noteWidgetsFromMap, uId: map["uId"] as String);
  }
  Map<String, Object> toMap() {
    List<Map<String, Object>> mapWidgets =
        noteWidgets.map((widget) => widget.toMap()).toList();

    return {"uId": uId, "title": title, "noteWidgets": mapWidgets};
  }
}
