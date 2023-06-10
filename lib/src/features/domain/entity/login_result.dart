import 'user.dart';
import 'package:equatable/equatable.dart';

class LoginResult extends Equatable {
  final bool success;
  final User? user;

  const LoginResult({required this.success, required this.user});

  factory LoginResult.success(User user) =>
      LoginResult(success: true, user: user);

  factory LoginResult.failure() => LoginResult(success: false, user: null);

  @override
  List<Object?> get props => [success, user];
}
