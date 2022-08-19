import 'package:flutter/material.dart' hide TextField;
import 'package:modula_notes/models/note_model.dart';
import 'package:modula_notes/models/note_widget_model.dart';
import 'package:modula_notes/models/text_widget_note_model.dart';
import 'package:modula_notes/models/todo_widget_note_model.dart';
import 'package:modula_notes/providers/notes_db_provider.dart';
import 'package:modula_notes/providers/notes_provider.dart';
import 'package:modula_notes/shared/widgets/note_editor.dart';
import 'package:modula_notes/shared/widgets/text_fields/text_field.dart';
import 'package:provider/provider.dart';

class EditNotePage extends StatelessWidget {
  final noteViewerKey = GlobalKey<NoteEditorState>();
  final NoteModel noteModel;
  late final TextEditingController titleFieldController;
  final bool isNewNote;

  EditNotePage(this.noteModel, {Key? key, this.isNewNote = false})
      : super(key: key) {
    titleFieldController = TextEditingController(text: noteModel.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
        placeholder: "Titulo",
        controller: titleFieldController,
      )),
      body: NoteEditor(
        noteWidgets: noteModel.noteWidgets,
        key: noteViewerKey,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            List<NoteWidgetModel> modifiedWidgets =
                List.from(noteViewerKey.currentState!.noteWidgetsModel);

            NoteModel newNote = NoteModel(titleFieldController.text,
                noteWidgets: modifiedWidgets, uId: noteModel.uId);

            NotesProvider notesProvider = context.read<NotesProvider>();
            NotesDbProvider notesDbProvider = context.read<NotesDbProvider>();
            if (isNewNote) {
              notesProvider.addNote(newNote);
              notesDbProvider.addNote(newNote);
            } else {
              notesProvider.modifyNote(noteModel, newNote);
              notesDbProvider.updateNote(noteModel.uId, newNote);
            }
            Navigator.pop(context);
          }),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(children: [
          IconButton(
              onPressed: () => noteViewerKey.currentState!
                  .addNoteWidget(TextWidgetNoteModel("")),
              icon: const Icon(Icons.short_text_rounded)),
          IconButton(
              onPressed: () => noteViewerKey.currentState!
                  .addNoteWidget(TodoWidgetNoteModel(false, "")),
              icon: const Icon(Icons.check_box)),
        ]),
      ),
    );
  }
}
