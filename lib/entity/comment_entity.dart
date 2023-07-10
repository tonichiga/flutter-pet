import 'package:my_app/entity/author_entity.dart';

class CommentEntity {
  final String id;
  final String message;
  final AuthorEntity author;

  CommentEntity({
    required this.id,
    required this.message,
    required this.author,
  });

  factory CommentEntity.fromJson(Map<String, dynamic> json) {
    return CommentEntity(
        id: json['id'],
        message: json['message'] ?? "",
        author: AuthorEntity.fromJson(json['author']));
  }
}
