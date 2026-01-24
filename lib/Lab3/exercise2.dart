class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], email: json['email']);
  }

  @override
  String toString() => 'User(name: $name, email: $email)';
}

Future<List<User>> fetchUsers() async {
  await Future.delayed(Duration(milliseconds: 500));
  final List<Map<String, dynamic>> jsonData = [
    {'name': 'Duca 1', 'email': 'duca1@email.com'},
    {'name': 'Duca 2', 'email': 'duca2@email.com'},
  ];

  return jsonData.map((item) => User.fromJson(item)).toList();
}

void main() async {
  print("\nExercise 2");
  final users = await fetchUsers();
  users.forEach(print);
}
