import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class AppDataBase {
  Future<Database> initDatabase() async {
    return await openDatabase(
      version: 1,
      path.join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, _) {
        db.execute('''
        CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            email TEXT NOT NULL,
            password TEXT NOT NULL,
            loginCount INTEGER NOT NULL
          )
        ''');
      },
    );
  }
}
