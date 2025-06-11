import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/model/book.dart';

class BookService {
  // URL da API com o proxy CORS Anywhere para desenvolvimento
  static const String _corsProxy = 'https://cors-anywhere.herokuapp.com/';
  static const String _baseUrl = 'api.nytimes.com/svc/books/v3';

  // Sua chave de API
  final String _apiKey = '3H6GSoORwAjN3YVZaVfWWpmyIsXfp5rh';

  Future<List<Book>> fetchBestSellers() async {
    final url = Uri.parse('${_corsProxy}https://${_baseUrl}/lists/current/combined-print-and-e-book-fiction.json?api-key=$_apiKey');
    
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> booksJson = data['results']['books'];
        // Mapeia a lista de JSON para uma lista de objetos Book
        return booksJson.map((json) => Book.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao carregar livros: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de rede ou ao buscar livros: $e');
    }
  }
}