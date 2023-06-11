import 'package:flutter_test/flutter_test.dart';
import 'package:izam/src/features/domain/entity/user.dart';
import 'package:izam/src/features/domain/entity/login_result.dart';

void main() {
  group('LoginResult', () {
    test('should return success result with user', () {
      // Arrange
      final user = User(
        id: 1,
        email: 'WWW.1111@iazm.co',
        password: 'Password1!',
        loginCount: 1,
      );
      final loginResult = LoginResult.success(user);

      // Act & Assert
      expect(loginResult.success, true);
      expect(loginResult.user, user);
    });

    test('should return failure result', () {
      // Arrange
      final loginResult = LoginResult.failure();

      // Act & Assert
      expect(loginResult.success, false);
      expect(loginResult.user, null);
    });

    test('should override props correctly', () {
      // Arrange
      final user1 = User(
        id: 1,
        email: 'WWW.1111@iazm.co',
        password: 'Password1!',
        loginCount: 1,
      );
      final user2 = User(
        id: 2,
        email: 'WWW.2222@iazm.co',
        password: 'Password1!',
        loginCount: 1,
      );

      final loginResult1 = LoginResult.success(user1);
      final loginResult2 = LoginResult.success(user2);
      final loginResult3 = LoginResult.failure();

      // Act & Assert
      expect(loginResult1.props, [true, user1]);
      expect(loginResult2.props, [true, user2]);
      expect(loginResult3.props, [false, null]);
    });
  });
}
