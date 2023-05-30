class User {
  String id = "";
  String name;
  String email;
  String password;

  User(this.id, this.name, this.email, this.password);

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final email = json['email'];
    final password = json['password'];

    return User(id, name, email, password);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'User{id: $id, name: $name, email: $email, password: $password}';
  }
}
