class PostEntity {
  final String id;
  final String name;
  final String comments;
  final String address;
  final String image;

  PostEntity({
    required this.id,
    required this.name,
    required this.comments,
    required this.address,
    required this.image,
  });

  factory PostEntity.fromJson(Map<String, dynamic> json) {
    return PostEntity(
        name: json['name'] ?? "",
        comments: json['comments'] ?? "0",
        address: json['address'] ?? "",
        image: json['image'] ?? "",
        id: json["id"]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'User{ id: $id, name: $name, comments: $comments, address: $address}';
  }
}
