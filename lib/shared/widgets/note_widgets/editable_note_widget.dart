import 'package:flutter/material.dart';

abstract class EditableNoteWidget extends StatelessWidget {
  void Function(DismissDirection, Key)? onDismissed;
  Key dismissableItemKey;

  EditableNoteWidget(
      {Key? key, required this.dismissableItemKey, this.onDismissed})
      : super(key: key);
}
