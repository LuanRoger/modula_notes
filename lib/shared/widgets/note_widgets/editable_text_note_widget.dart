import 'package:flutter/material.dart' hide TextField;
import 'package:modula_notes/models/text_widget_note_model.dart';
import 'package:modula_notes/shared/widgets/note_widgets/editable_note_widget.dart';
import 'package:modula_notes/shared/widgets/text_fields/text_field.dart';

class EditableTextNoteWidget extends EditableNoteWidget {
  final TextWidgetNoteModel model;

  const EditableTextNoteWidget(this.model,
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
        title: TextField(
          placeholder: "Text",
          initialValue: model.value,
          onChanged: (newValue) => model.value = newValue,
        ),
        trailing: const Icon(Icons.drag_indicator_rounded),
      ),
    );
  }
}
