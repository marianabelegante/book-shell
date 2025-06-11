import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/auth_controller.dart';
import 'package:myapp/controller/ book_controller.dart';
import 'package:myapp/view/books_tab.dart';
import 'package:myapp/view/favorites_tab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Injeta o BookController na primeira vez que a HomeView é construída
  final BookController bookController = Get.put(BookController());
  final AuthController authController = Get.find();
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    BooksTab(),
    FavoritesTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Best-Sellers' : 'Meus Favoritos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () {
              bookController.clearFavorites();
              authController.signOut();
            },
          ),
        ],
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            activeIcon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
