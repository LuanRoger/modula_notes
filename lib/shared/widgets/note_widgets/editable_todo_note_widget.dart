import 'package:flutter/material.dart' hide TextField;
import 'package:my_notes/models/todo_widget_note_model.dart';
import 'package:my_notes/shared/widgets/note_widgets/editable_note_widget.dart';
import 'package:my_notes/shared/widgets/text_fields/text_field.dart';

class EditableTodoNoteWidget extends EditableNoteWidget {
  TodoWidgetNoteModel model;

  EditableTodoNoteWidget(this.model,
      {Key? key,
      required Key dismissableItemKey,
      void Function(DismissDirection, Key)? onDismissed})
      : super(
            key: key,
            dismissableItemKey: dismissableItemKey,
            onDismissed: onDismissed);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: dismissableItemKey,
      onDismissed: (direction) =>
          onDismissed?.call(direction, dismissableItemKey),
      child: ListTile(
        leading: Checkbox(
          value: model.done,
          onChanged: (value) => model.done = value ?? false,
        ),
        title: TextField(
            placeholder: "Text",
            maxLines: 1,
            initialValue: model.value,
            onChanged: (newValue) => model.value = newValue),
        trailing: const Icon(Icons.drag_indicator_rounded),
      ),
    );
  }
}
