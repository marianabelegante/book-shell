import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/model/book.dart';
import 'package:myapp/controller/ book_controller.dart';

class BookListItem extends StatelessWidget {
  final Book book;
  final BookController bookController = Get.find();

  BookListItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading:
              (book.coverImageUrl.isNotEmpty)
                  ? Image.network(
                    book.coverImageUrl,
                    fit: BoxFit.cover,
                    width: 50,
                    errorBuilder:
                        (_, __, ___) =>
                            const Icon(Icons.broken_image, size: 50),
                    loadingBuilder:
                        (_, child, progress) =>
                            progress == null
                                ? child
                                : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                  )
                  : const Icon(Icons.book, size: 50),
          title: Text(
            book.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(book.author),
          trailing: Obx(() {
            final isFav = bookController.isFavorite(book);
            return IconButton(
              icon: Icon(
                isFav ? Icons.star : Icons.star_border,
                color:
                    isFav
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.grey.shade400,
                size: 30,
              ),
              onPressed: () => bookController.toggleFavorite(book),
            );
          }),
        ),
      ),
    );
  }
}
