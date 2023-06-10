import 'package:flutter_test/flutter_test.dart';
import 'package:izam/src/features/domain/entity/user.dart';

void main() {
  group('User', () {
    test('should correctly initialize with provided values', () {
      // Arrange
      const id = 1;
      const email = 'WWW.1111@izam.co';
      const password = 'Password7!';
      const loginCount = 0;

      // Act
      final user = User(
          id: id, email: email, password: password, loginCount: loginCount);

      // Assert
      expect(user.id, id);
      expect(user.email, email);
      expect(user.password, password);
      expect(user.loginCount, loginCount);
    });

    test('should correctly initialize from map', () {
      // Arrange
      final map = {
        'id': 1,
        'email': 'WWW.1111@izam.co',
        'password': 'Password7!',
        'loginCount': 0,
      };

      // Act
      final user = User.fromMap(map);

      // Assert
      expect(user.id, map['id']);
      expect(user.email, map['email']);
      expect(user.password, map['password']);
      expect(user.loginCount, map['loginCount']);
    });

    test('should correctly convert to map', () {
      // Arrange
      final user = User(
        id: 1,
        email: 'WWW.1111@izam.co',
        password: 'Password!',
        loginCount: 0,
      );

      // Act
      final map = user.toMap();

      // Assert
      expect(map['id'], user.id);
      expect(map['email'], user.email);
      expect(map['password'], user.password);
      expect(map['loginCount'], user.loginCount);
    });

    test('should correctly copy with new values', () {
      // Arrange
      final user = User(
        id: 1,
        email: 'WWW.1111@izam.co',
        password: 'Password!',
        loginCount: 0,
      );
      const newId = 2;
      const newPassword = 'New_password7!';
      const newLoginCount = 1;

      // Act
      final copiedUser = user.copyWith(
          id: newId, password: newPassword, loginCount: newLoginCount);

      // Assert
      expect(copiedUser.id, newId);
      expect(copiedUser.email, user.email);
      expect(copiedUser.password, newPassword);
      expect(copiedUser.loginCount, newLoginCount);
    });

    test('should correctly compare equality', () {
      // Arrange
      final user1 = User(
        id: 1,
        email: 'WWW.1111@izam.co',
        password: 'Password!',
        loginCount: 0,
      );
      final user2 = User(
        id: 1,
        email: 'WWW.1111@izam.co',
        password: 'Password!',
        loginCount: 0,
      );
      final user3 = User(
        id: 2,
        email: 'WWW.1111@izam.co',
        password: 'Password7!',
        loginCount: 0,
      );

      // Act & Assert
      expect(user1 == user2, true);
      expect(user1 == user3, false);
      expect(user2 == user3, false);
    });

    test('should correctly generate props list', () {
      // Arrange
      final user = User(
          id: 1,
          email: 'WWW.1111@izam.co',
          password: 'Password!',
          loginCount: 0);

      // Act
      final props = user.props;

      // Assert
      expect(props.length, 4);
      expect(props.contains(user.id), true);
      expect(props.contains(user.email), true);
      expect(props.contains(user.password), true);
      expect(props.contains(user.loginCount), true);
    });
  });
}
