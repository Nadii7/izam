import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class User extends Equatable {
  final int id;
  final String email;
  final String password;
  int loginCount;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.loginCount,
  });

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        email = map['email'],
        password = map['password'],
        loginCount = map['loginCount'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'loginCount': loginCount,
    };
  }

  User copyWith({int? id, int? loginCount}) {
    return User(
      id: id ?? this.id,
      email: email,
      password: password,
      loginCount: loginCount ?? this.loginCount,
    );
  }

  @override
  List<Object?> get props => [id, email, password, loginCount];
}
