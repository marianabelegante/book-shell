import 'package:get/get.dart';
import 'package:myapp/model/book.dart';
import 'package:myapp/service/book_service.dart';

class BookController extends GetxController {
  final BookService _bookService = BookService();

  var isLoading = true.obs;
  var bookList = <Book>[].obs;
  // Lista de favoritos (MOCADA, em memória)
  var favoriteList = <Book>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  void fetchBooks() async {
    try {
      isLoading.value = true;
      var books = await _bookService.fetchBestSellers();
      if (books.isNotEmpty) {
        bookList.value = books;
      }
    } catch (e) {
      Get.snackbar('Erro', 'Não foi possível carregar os livros.');
    } finally {
      isLoading.value = false;
    }
  }

  bool isFavorite(Book book) {
    // Verifica se um livro com o mesmo ID já existe na lista de favoritos
    return favoriteList.any((favBook) => favBook.id == book.id);
  }

  void toggleFavorite(Book book) {
    if (isFavorite(book)) {
      favoriteList.removeWhere((favBook) => favBook.id == book.id);
    } else {
      favoriteList.add(book);
    }
  }

  // Limpa os favoritos ao fazer logout
  void clearFavorites() {
    favoriteList.clear();
  }
}
