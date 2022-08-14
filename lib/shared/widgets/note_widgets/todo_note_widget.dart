import 'package:flutter/material.dart';
import 'package:my_notes/models/todo_widget_note_model.dart';

class TodoNoteWidget extends StatelessWidget {
  TodoWidgetNoteModel todoWidgetNoteModel;

  TodoNoteWidget(this.todoWidgetNoteModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key,
      leading: Checkbox(
        value: todoWidgetNoteModel.done,
        onChanged: null,
      ),
      title: Text(todoWidgetNoteModel.value),
    );
  }
}
