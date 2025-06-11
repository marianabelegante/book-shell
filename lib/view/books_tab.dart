import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/ book_controller.dart';
import 'package:myapp/view/book_list_item.dart';
import 'package:myapp/controller/ book_controller.dart';
class BooksTab extends StatelessWidget {
  final BookController bookController = Get.find();

  BooksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (bookController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (bookController.bookList.isEmpty) {
        return const Center(child: Text('Nenhum livro encontrado.'));
      }
      return ListView.builder(
        itemCount: bookController.bookList.length,
        itemBuilder: (context, index) {
          final book = bookController.bookList[index];
          return BookListItem(book: book);
        },
      );
    });
  }
}
