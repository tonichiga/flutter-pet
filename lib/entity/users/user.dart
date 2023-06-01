class User {
  String? name;
  String? email;
  String? password;
  String? id;

  User(this.name, this.email, this.password, this.id);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['name'], json['email'], json['password'], json["id"]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'User{ name: $name, email: $email, password: $password}';
  }
}
