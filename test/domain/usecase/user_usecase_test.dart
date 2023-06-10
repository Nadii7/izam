import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:izam/app/domain/entity/user.dart';
import 'package:izam/app/domain/usecase/user_usecase.dart';
import 'package:izam/app/domain/repository/user_repository.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late UserUseCase userUseCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    userUseCase = UserUseCase(mockUserRepository);
  });

  group('UserUseCase', () {
    group('login', () {
      test('should return LoginResult.success with updated user', () async {
        // Arrange
        const email = 'WWW.1111@izam.co';
        const password = 'Password7!';
        final user =
            User(id: 1, email: email, password: password, loginCount: 0);

        when(mockUserRepository.loginUser(email, password))
            .thenAnswer((_) => Future.value(user));
        when(mockUserRepository.updateUser(user))
            .thenAnswer((_) => Future.value());

        // Act
        final result = await userUseCase.login(email, password);

        // Assert
        expect(result.success, true);
        expect(result.user, user);
        expect(user.loginCount, 1);
        verify(mockUserRepository.updateUser(user)).called(1);
      });

      test('should return LoginResult.failure when an error occurs', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password';

        when(mockUserRepository.loginUser(email, password))
            .thenThrow(Exception());

        // Act
        final result = await userUseCase.login(email, password);

        // Assert
        expect(result.success, false);
        expect(result.user, null);
      });
    });

    group('resetPassword', () {
      test('should return LoginResult.success with updated user', () async {
        // Arrange
        const email = 'WWW.1111@izam.co';
        final user =
            User(id: 1, email: email, password: 'old_password', loginCount: 0);

        when(mockUserRepository.resetPassword(email))
            .thenAnswer((_) => Future.value(user));

        // Act
        final result = await userUseCase.resetPassword(email);

        // Assert
        expect(result.success, true);
        expect(result.user, user);
      });

      test('should return LoginResult.failure when an error occurs', () async {
        // Arrange
        const email = 'test@example.com';

        when(mockUserRepository.resetPassword(email)).thenThrow(Exception());

        // Act
        final result = await userUseCase.resetPassword(email);

        // Assert
        expect(result.success, false);
        expect(result.user, null);
      });
    });
  });
}
