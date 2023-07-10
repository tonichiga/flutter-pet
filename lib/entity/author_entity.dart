class AuthorEntity {
  final String id;
  final String name;
  final String avatar;

  AuthorEntity({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory AuthorEntity.fromJson(Map<String, dynamic> json) {
    return AuthorEntity(
      id: json['id'],
      name: json['name'] ?? "",
      avatar: json['avatar'] ?? "",
    );
  }
}
