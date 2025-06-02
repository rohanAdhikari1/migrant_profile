import 'dart:convert';

class User {
  final String token;
  final int id;
  final String firstName;
  final String lastName;

  User({
    required this.token,
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      token: map['token'] ?? '',
      id: map['id'] ?? 0,
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
    );
  }

  String toJson() {
    final data = toMap();
    return data.toString();
  }

  factory User.fromJson(String json) {
    final map = Map<String, dynamic>.from(jsonDecode(json));
    return User.fromMap(map);
  }
}
