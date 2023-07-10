import 'package:flutter/material.dart';
import 'package:my_app/components/comment/comment.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({super.key});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final String image = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.teal,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          "Post Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 240,
                width: double.infinity, // Высота контейнера
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(10), // Радиус закругления краев
                  image: DecorationImage(
                    image: image.isNotEmpty
                        ? NetworkImage(image)
                        : const AssetImage('assets/images/bg.jpeg')
                            as ImageProvider,
                    // Путь к изображению
                    fit: BoxFit.cover, // Масштабирование изображения
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 32)),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: const Comment(),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: const Comment(),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: const Comment(),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: const Comment(),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: const Comment(),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: const Comment(),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: const Comment(),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: const Comment(),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
