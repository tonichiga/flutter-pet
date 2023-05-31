class User {
  // String id = "";
  String? name;
  String? email;
  String? password;

  User(this.name, this.email, this.password);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['name'], json['email'], json['password']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'User{ name: $name, email: $email, password: $password}';
  }
}
