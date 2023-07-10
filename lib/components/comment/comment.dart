import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [
      Container(
        height: 36,
        width: 36, // Высота контейнера
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), // Радиус закругления краев
          image: const DecorationImage(
            image: AssetImage('assets/images/bg.jpeg'),
            // Путь к изображению
            fit: BoxFit.cover, // Масштабирование изображения
          ),
        ),
      ),
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(0, 0, 0, 0.03),
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(16),
          child: const Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "London is the capital of Great Britain. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "09 июня, 2020 | 08:40",
                  style: TextStyle(fontSize: 13, color: Color(0xFFBDBDBD)),
                ),
              ),
            ],
          ))
    ];

    if (false) {
      rowChildren = rowChildren.reversed.toList();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rowChildren,
    );
  }
}
