import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:izam/src/features/domain/entity/user.dart';
import 'package:izam/src/features/data/repository/user_repository_impl.dart';

void main() {
  group('UserRepositoryImplTest', () {
    late UserRepositoryImpl repository;
    late Database database;

    setUpAll(() async {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
      repository = UserRepositoryImpl(database);

      // Create the 'users' table
      await database.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY,
          email TEXT,
          password TEXT,
          loginCount INTEGER
        )
      ''');
    });

    tearDown(() async {
      await database.close();
    });

    test(
        'loginUser() should return the user if the email and password are correct',
        () async {
      final user = User(
        id: 1,
        email: 'example@gmail.com',
        password: 'password',
        loginCount: 0,
      );
      await database.insert('users', user.toMap());

      final result =
          await repository.loginUser('example@gmail.com', 'password');

      expect(result, equals(user));
    });

    test('updateUser() should update the user in the database', () async {
      final user = User(
        id: 1,
        email: 'example@gmail.com',
        password: 'password',
        loginCount: 0,
      );

      await database.insert('users', user.toMap());

      await repository.updateUser(user.copyWith(loginCount: 1));

      final result = await database.query('users', where: 'id = 1');

      expect(result[0]['loginCount'], equals(1));
    });
  });
}
