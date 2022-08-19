import 'package:modula_notes/models/note_model.dart';
import 'package:sembast/sembast.dart';

class NotesDbProvider {
  Database database;
  late StoreRef<String, Map<String, Object?>> mainStoreReference;

  NotesDbProvider(this.database) {
    mainStoreReference = stringMapStoreFactory.store("notes");
  }

  Future<List<NoteModel>> getAll() async {
    List<RecordSnapshot<String, Map<String, Object?>>> notesSnapshot =
        await mainStoreReference.find(database);
    List<NoteModel> notes =
        notesSnapshot.map((note) => NoteModel.fromMap(note.value)).toList();

    return notes;
  }

  Future addNote(NoteModel noteModel) async {
    await mainStoreReference
        .record(noteModel.uId)
        .add(database, noteModel.toMap());
  }

  Future removeNote(String noteUuId) async {
    await mainStoreReference.record(noteUuId).delete(database);
  }

  Future updateNote(String noteUuId, NoteModel newInfos) async {
    await mainStoreReference
        .record(noteUuId)
        .update(database, newInfos.toMap());
  }
}
