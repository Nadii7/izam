import 'package:path/path.dart' as path;
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:izam/src/features/data/database/app_database.dart';

void main() {
  // Ensure Flutter is initialized
  TestWidgetsFlutterBinding.ensureInitialized();
  // Initialize sqflite_ffi
  sqfliteFfiInit();
  // Set databaseFactory to databaseFactoryFfi
  databaseFactory = databaseFactoryFfi;

  group('AppDataBase', () {
    late AppDataBase appDataBase;

    setUp(() {
      appDataBase = AppDataBase();
    });

    test('Database should be initialized and open', () async {
      final databasePath = await getDatabasesPath();
      final expectedDatabasePath = path.join(databasePath, 'user_database.db');

      final database = await appDataBase.initDatabase();

      expect(database.path, expectedDatabasePath);
      expect(await database.getVersion(), 1);
    });

    test('Database should contain the users table', () async {
      final databasePath = await getDatabasesPath();
      final expectedDatabasePath = path.join(databasePath, 'user_database.db');

      final database = await appDataBase.initDatabase();

      expect(database.path, expectedDatabasePath);
      expect(await database.getVersion(), 1);

      final tables = await database.query(
        'sqlite_master',
        where: 'type = ?',
        whereArgs: ['table'],
      );

      final tableNames = tables.map((table) => table['name']).toList();
      expect(tableNames.contains('users'), true);
    });

    test('initDatabase - Users table should have the expected columns',
        () async {
      final databasePath = await getDatabasesPath();
      final expectedDatabasePath = path.join(databasePath, 'user_database.db');

      final database = await appDataBase.initDatabase();

      expect(database.path, expectedDatabasePath);
      expect(await database.getVersion(), 1);

      final columns = await database.rawQuery('PRAGMA table_info(users)');
      final columnNames = columns.map((column) => column['name']).toList();

      expect(columnNames.contains('id'), true);
      expect(columnNames.contains('email'), true);
      expect(columnNames.contains('password'), true);
      expect(columnNames.contains('loginCount'), true);
    });
  });
}


