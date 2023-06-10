// import 'package:flutter_test/flutter_test.dart';
// import 'package:izam/app/data/database/init_database.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart' as path;
// import 'package:mockito/mockito.dart';

// class MockDatabase extends Mock implements Database {}

// void main() {
//   group('initDatabase', () {
//     test('should open database with correct version and path', () async {
//       // Arrange
//       final mockDatabase = MockDatabase();
//       const expectedVersion = 1;
//       final expectedPath =
//           path.join(await getDatabasesPath(), 'user_database.db');

//       when(mockDatabase.isOpen).thenReturn(true);

//       // Act
//       final result = await initDatabase(databaseFactory: (_) => mockDatabase);

//       // Assert
//       expect(result, mockDatabase);
//       verify(openDatabase(
//         version: expectedVersion,
//         path: expectedPath,
//         onCreate: anyNamed('onCreate'),
//       )).called(1);
//     });

//     test('should create "users" table on database creation', () async {
//       // Arrange
//       final mockDatabase = MockDatabase();

//       when(mockDatabase.isOpen).thenReturn(false);

//       // Act
//       await initDatabase(databaseFactory: (_) => mockDatabase);

//       // Assert
//       verify(mockDatabase.execute('''
//         CREATE TABLE users(
//           id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//           email TEXT NOT NULL,
//           password TEXT NOT NULL,
//           loginCount INTEGER NOT NULL
//         )
//       ''')).called(1);
//     });
//   });
// }
