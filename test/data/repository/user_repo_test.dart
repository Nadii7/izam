// import 'package:flutter_test/flutter_test.dart';
// import 'package:izam/app/data/repository/user_repository_impl.dart';
// import 'package:mockito/mockito.dart';
// import 'package:sqflite/sqflite.dart';

// class MockDatabase extends Mock implements Database {}

// void main() {
//   group('UserRepositoryImpl', () {
//     late UserRepositoryImpl userRepository;
//     late MockDatabase mockDatabase;

//     setUp(() {
//       mockDatabase = MockDatabase();
//       userRepository = UserRepositoryImpl(mockDatabase);
//     });

//     test('loginUser should return user if credentials match', () async {
//       // Arrange
//       const email = 'test@example.com';
//       const password = 'password';
//       final result = [
//         {
//           'id': 1,
//           'email': email,
//           'password': password,
//           'loginCount': 0,
//         }
//       ];
//       when(mockDatabase.query(any,
//               where: anyNamed('where'), whereArgs: anyNamed('whereArgs')))
//           .thenAnswer((_) async => result);

//       // Act
//       final user = await userRepository.loginUser(email, password);

//       // Assert
//       expect(user, isNotNull);
//       expect(user!.email, email);
//       expect(user.password, password);
//     });

//     test('loginUser should return null if credentials do not match', () async {
//       // Arrange
//       const email = 'test@example.com';
//       const password = 'password';
//       final result = [
//         {
//           'id': 1,
//           'email': email,
//           'password': 'wrong_password',
//           'loginCount': 0,
//         }
//       ];
//       when(mockDatabase.query(any,
//               where: anyNamed('where'), whereArgs: anyNamed('whereArgs')))
//           .thenAnswer((_) async => result);

//       // Act
//       final user = await userRepository.loginUser(email, password);

//       // Assert
//       expect(user, isNull);
//     });

//     test('loginUser should create a new user if no matching user found',
//         () async {
//       // Arrange
//       const email = 'new_user@example.com';
//       const password = 'new_password';
//       const id = 2;
//       when(mockDatabase.query(any,
//               where: anyNamed('where'), whereArgs: anyNamed('whereArgs')))
//           .thenAnswer((_) async => []);

//       when(mockDatabase.rawInsert(any, any)).thenAnswer((_) async => id);

//       // Act
//       final user = await userRepository.loginUser(email, password);

//       // Assert
//       expect(user, isNotNull);
//       expect(user!.email, email);
//       expect(user.password, password);
//       expect(user.id, id);
//     });

//     test('updateUser should update the user in the database', () async {
//       // Arrange
//       final user = User(
//           id: 1,
//           email: 'test@example.com',
//           password: 'password',
//           loginCount: 1);

//       // Act
//       await userRepository.updateUser(user);

//       // Assert
//       verify(mockDatabase.update(
//         any,
//         user.toMap(),
//         where: anyNamed('where'),
//         whereArgs: anyNamed('whereArgs'),
//       )).called(1);
//     });

//     test(
//         'resetPassword should change the user password and return the updated user',
//         () async {
//       // Arrange
//       const email = 'test@example.com';
//       final result = [
//         {
//           'id': 1,
//           'email': email,
//           'password': 'old_password',
//           'loginCount': 0,
//         }
//       ];
//       when(mockDatabase.query(any,
//               where: anyNamed('where'), whereArgs: anyNamed('whereArgs')))
//           .thenAnswer((_) async => result);

//       const generatedPassword = 'new_password';
//       when(userRepository.generatePassword()).thenReturn(generatedPassword);

//       // Act
//       final user = await userRepository.resetPassword(email);

//       // Assert
//       expect(user, isNotNull);
//       expect(user!.email, email);
//       expect(user.password, generatedPassword);
//     });

//     test(
//         'resetPassword should return null if no user found with the given email',
//         () async {
//       // Arrange
//       const email = 'nonexistent_user@example.com';
//       when(mockDatabase.query(any,
//               where: anyNamed('where'), whereArgs: anyNamed('whereArgs')))
//           .thenAnswer((_) async => []);

//       // Act
//       final user = await userRepository.resetPassword(email);

//       // Assert
//       expect(user, isNull);
//     });
//   });
// }
