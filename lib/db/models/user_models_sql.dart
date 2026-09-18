import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModelsSql {
  final int? id;
  final String email;
  final String password;
  UserModelsSql({
    this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
    };
  }

  factory UserModelsSql.fromMap(Map<String, dynamic> map) {
    return UserModelsSql(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelsSql.fromJson(String source) => UserModelsSql.fromMap(json.decode(source) as Map<String, dynamic>);
}
