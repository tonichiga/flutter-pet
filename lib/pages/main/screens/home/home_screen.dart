import 'package:flutter/material.dart';
import 'package:my_app/components/widgets/post_card.dart';
import 'package:my_app/entity/post_entity.dart';

class HomeScreen extends StatefulWidget {
  final List<PostEntity> posts;
  const HomeScreen({required this.posts, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  handleTap(PostEntity post) {
    Navigator.pushNamed(context, "/post", arguments: {post});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ...widget.posts.map(
            (e) => Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: PostCard(
                  post: e,
                  onTap: handleTap,
                )),
          ),
        ],
      ),
    );
  }
}
