import 'package:flutter/material.dart';
import 'package:modula_notes/models/note_model.dart';
import 'package:modula_notes/providers/notes_db_provider.dart';
import 'package:modula_notes/providers/notes_provider.dart';
import 'package:modula_notes/routes/app_routes.dart';
import 'package:modula_notes/shared/widgets/notes_grid.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    reloadNotesGrid(context);
  }

  Future reloadNotesGrid(BuildContext context) async {
    Provider.of<NotesProvider>(context, listen: false)
        .repopulateNotes(await context.read<NotesDbProvider>().getAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modula Notes"),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.SETTINGS_ROUTE),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Consumer<NotesProvider>(
        builder: (_, value, __) => RefreshIndicator(
          onRefresh: () async => reloadNotesGrid(context),
          child: NotesGrid(
            notes: value.notes,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          NoteModel noteModel = NoteModel.newNote();

          Navigator.pushNamed(context, AppRoutes.EDIT_NOTE_ROUTE,
              arguments: [noteModel, true]);
        },
      ),
    );
  }
}
