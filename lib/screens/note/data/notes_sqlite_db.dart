import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

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
}
