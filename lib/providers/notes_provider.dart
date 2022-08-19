import 'package:flutter/material.dart';
import 'package:modula_notes/models/note_model.dart';

class NotesProvider extends ChangeNotifier {
  List<NoteModel> _notes = List.empty(growable: true);
  List<NoteModel> get notes => _notes;

  void addNote(NoteModel note) {
    _notes.add(note);
    notifyListeners();
  }

  void removeNoteByIndex(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }

  void removeNoteByModel(NoteModel noteModel) {
    _notes.remove(noteModel);
    notifyListeners();
  }

  void modifyNote(NoteModel oldNote, NoteModel newNote) {
    int oldNoteIndex = _notes.indexOf(oldNote);
    _notes.removeAt(oldNoteIndex);
    _notes.insert(oldNoteIndex, newNote);

    notifyListeners();
  }

  void repopulateNotes(List<NoteModel> notes) {
    _notes.clear();
    _notes = List.from(notes, growable: true);

    notifyListeners();
  }

  bool existNote(NoteModel noteModel) {
    int noteIndex =
        _notes.indexWhere((note) => noteModel.hashCode == note.hashCode);
    return noteIndex != -1;
  }
}
