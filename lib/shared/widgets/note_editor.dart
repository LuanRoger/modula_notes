import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_notes/models/note_widget_model.dart';
import 'package:my_notes/models/text_widget_note_model.dart';
import 'package:my_notes/models/todo_widget_note_model.dart';
import 'package:my_notes/shared/utils/model_widget_converter.dart';
import 'package:my_notes/shared/widgets/note_widgets/editable_note_widget.dart';
import 'package:my_notes/shared/widgets/note_widgets/editable_text_note_widget.dart';
import 'package:my_notes/shared/widgets/note_widgets/editable_todo_note_widget.dart';

class NoteEditor extends StatefulWidget {
  List<NoteWidgetModel> noteWidgets;

  NoteEditor({Key? key, required this.noteWidgets}) : super(key: key);

  @override
  State<NoteEditor> createState() => NoteEditorState();
}

class NoteEditorState extends State<NoteEditor> {
  late List<NoteWidgetModel> noteWidgetsModel;
  late List<EditableNoteWidget> renderedWidgets;

  @override
  void initState() {
    super.initState();
    noteWidgetsModel = List.from(widget.noteWidgets);
    _rerenderWidgets();
  }

  void _rerenderWidgets() {
    setState(() => renderedWidgets =
        ModelWidgetConverter.createRenderedEditableNotesWidgets(
            noteWidgetsModel,
            onDismiss: _onDismissNoteWidget));
  }

  void addNoteWidget(NoteWidgetModel widgetModel) {
    noteWidgetsModel.add(widgetModel);
    _rerenderWidgets();
  }

  void _onDismissNoteWidget(DismissDirection direction, Key key) {
    int oldWidgetIndex = renderedWidgets
        .indexWhere((widget) => widget.dismissableItemKey == key);
    noteWidgetsModel.removeAt(oldWidgetIndex);

    _rerenderWidgets();
  }

  void _onReoderWidgetList(int oldIndex, int newIndex) {
    NoteWidgetModel widget = noteWidgetsModel.removeAt(oldIndex);
    noteWidgetsModel.insert(
        newIndex > oldIndex ? newIndex-- : newIndex, widget);

    _rerenderWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: _onReoderWidgetList,
      children: renderedWidgets,
    );
  }
}
