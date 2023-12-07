class User {
  final int? user_id;
  final String name;
  final String username;
  final String email;
  final String password;

  const User({this.user_id, required this.name, required this.username, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
    user_id: json['user_id'],
    name: json['name'],
    username: json['username'],
    email: json['email'],
    password: json['password']
  );
  
  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'name': name,
    'username': username,
    'email': email,
    'password': password
  };
  
}