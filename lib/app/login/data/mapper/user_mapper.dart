import 'dart:convert';

import 'package:estudo_bloc/app/login/domain/entities/user.dart';

class UserMapper {
  final int id;
  final String name;
  final String userName;
  final String email;
  final String phone;
  UserMapper({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.phone,
  });

  UserMapper copyWith({
    int? id,
    String? name,
    String? userName,
    String? email,
    String? phone,
  }) {
    return UserMapper(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userName': userName,
      'email': email,
      'phone': phone,
    };
  }

  factory UserMapper.fromMap(Map<String, dynamic> map) {
    return UserMapper(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserMapper.fromJson(String source) =>
      UserMapper.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserMapper(id: $id, name: $name, userName: $userName, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserMapper &&
        other.id == id &&
        other.name == name &&
        other.userName == userName &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        userName.hashCode ^
        email.hashCode ^
        phone.hashCode;
  }

  User toEntity() => User(
        id: id,
        name: name,
        userName: userName,
        email: email,
        phone: phone,
      );
}
