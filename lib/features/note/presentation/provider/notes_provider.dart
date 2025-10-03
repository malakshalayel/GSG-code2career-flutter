import 'package:e_commerce_design1/features/note/data/note_model.dart';
import 'package:e_commerce_design1/features/note/data/notes_sqlite_db.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ValueNotifier<List<NoteModel>> {
  //List<NoteModel> notes = [];
  NotesProvider() : super([]);
  //add
  void addNote(NoteModel note) {
    NotesSqliteDb.insertNoteToDb(note);

    value.add(note);
    notifyListeners();
  }

  //update
  void updateNote(NoteModel updatedNote) {
    int index = value.indexWhere((note) => note.id == updatedNote.id);
    if (index != -1) {
      value[index] = updatedNote;
      NotesSqliteDb.updateNoteFromDb(updatedNote);
    }
    notifyListeners();
  }

  //delete
  void deleteNote(NoteModel note) {
    NotesSqliteDb.deleteNoteFromDb(note);
    value.removeWhere((n) => n.id == note.id);
    notifyListeners();
  }

  //read
  void readNotes() async {
    value = await NotesSqliteDb.getNotesFromDb();
    notifyListeners();
  }
}
