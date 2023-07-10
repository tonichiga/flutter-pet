class UserEntity {
  int? id;
  String? email;
  String? name;
  String? password;

  UserEntity(this.name, this.email, this.password, this.id);

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
        json['name'], json['email'], json['password'], json["id"]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'User{ name: $name, email: $email, password: $password}';
  }
}
