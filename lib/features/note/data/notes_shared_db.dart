import 'dart:convert';

import 'package:e_commerce_design1/features/note/data/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesSharedDb {
  static late SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String noteKey = 'notes';
  static updatedListAtSharedDb(List<NoteModel> notes) async {
    List<String> notesAsString = [];
    for (var note in notes) {
      notesAsString.add(note.toJson());
    }
    prefs.setStringList(noteKey, notesAsString);
  }

  static Future<List<NoteModel>> fetchListFromSharedDb() async {
    var notesAsString = prefs.getStringList(noteKey) ?? [];
    List<NoteModel> notes = [];
    for (var n in notesAsString) {
      var noteDecoded = jsonDecode(n);
      NoteModel note = NoteModel.fromJson(noteDecoded);

      notes.add(note);
    }
    return notes;
  }
}
