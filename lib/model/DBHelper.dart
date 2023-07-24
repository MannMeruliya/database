import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const String databasename = "DataBase";
  static const int databaseversion = 1;

  static const String tablename = "Table";

  static final columnId = "_id";
  static final columnName = "name";
  static final columnAge = "age";

  DBHelper._privateConstructor();

  static final DBHelper instance = DBHelper._privateConstructor();
  static Database? _database;

  static Future<Database?> get database async {
    final databasePath = await getDatabasesPath();
    final status = await databaseExists(databasePath);

    if (!status || status != null) {
      _database = await openDatabase(join(databasePath, databasename),
          onCreate: (db, version) {
        print("version :: $version");
        return db.execute("Create Table $tablename("
            "$columnId INTEGER PRIMARY KEY AUTOINCREMENT,"
            "$columnName Text,"
            "$columnAge Text)");
      }, version: databaseversion);
    }
    return _database;
  }

  insert(Map<String, dynamic> row) async {
    final db = await database;
    try {
      db!.insert(tablename, row);
    } catch (e) {
      print("Error :: ${e}");
    }
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await database;
    List<Map<String, dynamic>> result = await db!.query(tablename);
    return result;
  }

  updateStatic(Map<String, dynamic> row, String id) async {
    Database? db = await database;
    return db!.update(tablename, row, where: '$columnId = ?', whereArgs: [id]);
  }

  deletRecord(String id) async {
    Database? db = await database;
    return await db!.delete(tablename, where: '$columnId = ?', whereArgs: [id]);
  }
}
