import 'package:flutter/material.dart';

abstract class EditableNoteWidget extends StatelessWidget {
  final void Function(DismissDirection, Key)? onDismissed;
  final Key dismissableItemKey;

  const EditableNoteWidget(
      {Key? key, required this.dismissableItemKey, this.onDismissed})
      : super(key: key);
}
