import 'dart:convert';

class UserModel {
  final String userName;
  final String firstName;
  final String lastName;
  final String password;
  final int id;
  UserModel({
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.password,
    required this.userName,
  });
  factory UserModel.fromMap(Map map) {
    return UserModel(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_ame'],
      password: map['password'],
      userName: map['username'],
    );
  }
  static Map<String, dynamic> toMap(UserModel model) {
    return {
      'username': model.userName,
      'first_name': model.firstName,
      'last_name': model.lastName,
      'password': model.password,
      'id': model.id,
    };
  }

  factory UserModel.fromJson(String json) {
    final map = jsonDecode(json);
    return UserModel.fromMap(map);
  }
}
