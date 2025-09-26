import 'package:e_commerce_design1/screens/note/data/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NotesSqliteDb {
  static late Database _database;
  static String tableName = 'notes';
  static String idColumn = 'id';
  static String titleColumn = 'title';
  static String contentColumn = 'content';
  static String dateColumn = 'date';

  static String dbPath = "notes.db";
  static Future<void> init() async {
    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        print('db created');
        db.execute(
          'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY, $titleColumn TEXT, $contentColumn TEXT, $dateColumn TEXT)',
        );
      },
      onOpen: (db) {
        print("db opened");
      },
    );
  }

  //crud
  //create
  static insertNoteToDb(NoteModel noteModel) async {
    int id = await _database.rawInsert(
      'INSERT INTO $tableName($titleColumn, $contentColumn, $dateColumn) VALUES("${noteModel.title}", "${noteModel.content}","${noteModel.date}")',
    );
    print('note inserted with id $id');
  }

  //read
  static Future<List<NoteModel>> getNotesFromDb() async {
    var result = await _database.rawQuery('SELECT * FROM $tableName');
    print('result $result');
    List<NoteModel> notes = [];
    for (var map in result) {
      NoteModel note = NoteModel.fromJson(map);
      notes.add(note);
    }
    return notes;
  }

  //delete
  static Future<void> deleteNoteFromDb(NoteModel note) async {
    var result = await _database.rawDelete(
      "DELETE FROM $tableName WHERE $idColumn = ${note.id}",
    );
    print("note deleted $result");
  }

  //update
  static updateNoteFromDb(NoteModel note) async {
    var result = await _database.rawUpdate(
      'UPDATE $tableName SET $titleColumn = ?, $contentColumn = ?, $dateColumn = ? WHERE $idColumn = ?',
      [note.title, note.content, note.date, note.id],
    );
    print('note updated $result');
  }
}
