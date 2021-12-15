class UserModel {
  final String username;
  final String? password;
  final String email;

  UserModel({required this.username,required this.password, required this.email});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'],
        username: map['username'],
        password: map['password']);
  }
}
