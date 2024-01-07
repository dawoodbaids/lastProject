import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'categorybox.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryBox(
          imagePath: 'assets/images/web.jpg',
          name: 'Web Developer',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/mobile.png',
          name: 'Mobile App Developer',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/soft.jpg',
          name: 'Software Engineer',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/data.jpg',
          name: 'Data Scientist',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/net.png',
          name: 'Network Engineer',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/cyper.jpg',
          name: 'Cybersecurity Analyst',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/system.jpg',
          name: 'System Administrator',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/base.png',
          name: 'Database Administrator',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/ai.jpg',
          name: 'AI Developer',
          
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/dev.jpg',
          name: 'DevOps Engineer',
          onPressed: () {
            handleCategorySelection();
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/game.png',
          name: 'Game Developer',
          onPressed: () {
            handleCategorySelection();
          },
        ),
      ],
    );
  }

// ignore: non_constant_identifier_names

  void handleCategorySelection() {
    // Implement your logic to handle the selected category
    if (kDebugMode) {
      print('Selected Category: ,');
    }
  }
}
