class User {
  final String id;
  final String name;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.password,
  });

  User copyWith({
    String? id,
    String? name,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }
}
