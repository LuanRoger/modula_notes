import 'package:flutter/material.dart';
import 'package:modula_notes/models/note_model.dart';
import 'package:modula_notes/pages/edit_note_page.dart';
import 'package:modula_notes/pages/view_note_page.dart';
import 'package:modula_notes/providers/notes_db_provider.dart';
import 'package:modula_notes/providers/notes_provider.dart';
import 'package:modula_notes/routes/app_routes.dart';
import 'package:modula_notes/shared/app_text_style.dart';
import 'package:modula_notes/shared/widgets/note_preview.dart';
import 'package:provider/provider.dart';

class NoteGridPreview extends StatelessWidget {
  final NoteModel noteModel;
  final int indexForHero;

  const NoteGridPreview(this.noteModel, {Key? key, required this.indexForHero})
      : super(key: key);

  void onSelectPopupMenu(String value, BuildContext context) {
    switch (value) {
      case "/edit_page":
        Navigator.pushNamed(context, AppRoutes.EDIT_NOTE_ROUTE,
            arguments: [noteModel, null]);
        break;
      case "/delete_dialog":
        deleteDialog(context);
        break;
    }
  }

  void deleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Deletar nota"),
              content: const Text("Você deseja remover esta nota?"),
              actions: [
                TextButton(
                    onPressed: () {
                      context
                          .read<NotesProvider>()
                          .removeNoteByModel(noteModel);
                      context.read<NotesDbProvider>().removeNote(noteModel.uId);
                      Navigator.pop(context);
                    },
                    child: const Text("Deletar")),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancelar"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () => Navigator.pushNamed(context, AppRoutes.VIEW_NOTE_ROUTE,
              arguments: [noteModel]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            noteModel.title,
                            style: AppTextStyle.NOTE_TITLE_GRID_PREVIEW,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Flexible(
                          child: PopupMenuButton(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: "/edit_page",
                                child: Text("Editar"),
                              ),
                              const PopupMenuItem(
                                value: "/delete_dialog",
                                child: Text("Deletar"),
                              )
                            ],
                            onSelected: (String value) =>
                                onSelectPopupMenu(value, context),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(flex: 0, child: NotePreview(noteModel.noteWidgets))
                ]),
          )),
    );
  }
}
