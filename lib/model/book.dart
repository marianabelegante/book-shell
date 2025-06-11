class Book {
  final String id;
  final String title;
  final String author;
  final String coverImageUrl;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverImageUrl,
  });

  // Construtor de fábrica para criar um Book a partir de um JSON
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id:
          json['primary_isbn13'] ??
          json['title'], // Usa ISBN como ID ou o título como fallback
      title: json['title'] ?? 'Título Desconhecido',
      author: json['author'] ?? 'Autor Desconhecido',
      coverImageUrl: json['book_image'] ?? '',
    );
  }
}
