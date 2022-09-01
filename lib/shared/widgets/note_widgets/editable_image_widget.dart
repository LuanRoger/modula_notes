import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modula_notes/controllers/image_picker_controller.dart';
import 'package:modula_notes/models/image_widget_note_model.dart';
import 'package:modula_notes/shared/widgets/note_widgets/editable_note_widget.dart';

class EditableImageWidget extends EditableNoteWidget {
  final ImageWidgetNoteModel noteModel;

  void Function(void Function())? _updateImageState;

  EditableImageWidget(this.noteModel,
      {Key? key,
      required Key dismissableItemKey,
      required void Function(DismissDirection, Key)? onDismissed})
      : super(
            key: key,
            dismissableItemKey: dismissableItemKey,
            onDismissed: onDismissed);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: dismissableItemKey,
      child: GestureDetector(
          onTap: () async {
            String? imagePath = await ImagePickerController.chooseImage();
            if (imagePath == null) return;

            _updateImageState?.call(() => noteModel.value = imagePath);
          },
          child: ListTile(
            title: StatefulBuilder(
              builder: (_, setState) {
                _updateImageState = setState;
                return Image.file(
                  File(noteModel.value),
                  fit: BoxFit.scaleDown,
                  errorBuilder: (_, __, ___) => Container(
                      color: Colors.red, child: const Icon(Icons.error)),
                );
              },
            ),
            trailing: const Icon(Icons.drag_indicator_rounded),
          )),
    );
  }
}
