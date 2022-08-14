import 'package:flutter/material.dart';

class TextField extends TextFormField {
  TextField(
      {Key? key,
      required String placeholder,
      String? initialValue,
      void Function(String)? onChanged,
      int? maxLines,
      TextEditingController? controller})
      : super(
            key: key,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: placeholder),
            initialValue: initialValue,
            maxLines: maxLines,
            controller: controller,
            onChanged: onChanged);
}
