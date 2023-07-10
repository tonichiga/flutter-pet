import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/entity/post_entity.dart';

class PostCard extends StatelessWidget {
  final Function(PostEntity) onTap;
  final PostEntity post;

  const PostCard({required this.onTap, required this.post, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(post);
      },
      child: Column(
        children: [
          Container(
            height: 240,
            width: double.infinity, // Высота контейнера
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(10), // Радиус закругления краев
              image: DecorationImage(
                image: post.image.isNotEmpty
                    ? NetworkImage(post.image)
                    : const AssetImage('assets/images/bg.jpeg')
                        as ImageProvider,
                // Путь к изображению
                fit: BoxFit.cover, // Масштабирование изображения
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Forest',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black
                  // Стили текста
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.comment,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                  ),
                  Text(post.comments,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                ],
              ),
              const Row(
                children: [
                  Icon(
                    Icons.location_city,
                    size: 16,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                  ),
                  Text("Address",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
