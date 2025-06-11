import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/ book_controller.dart';
import 'package:myapp/view/book_list_item.dart';

class FavoritesTab extends StatelessWidget {
  final BookController bookController = Get.find();

  FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (bookController.favoriteList.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star_border, size: 60, color: Colors.grey.shade400),
              const SizedBox(height: 16),
              const Text('Sua lista de favoritos está vazia.'),
            ],
          ),
        );
      }
      return ListView.builder(
        itemCount: bookController.favoriteList.length,
        itemBuilder: (context, index) {
          final book = bookController.favoriteList[index];
          return BookListItem(book: book);
        },
      );
    });
  }
}
