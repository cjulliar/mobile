import 'package:cook/pages/cellier_page.dart';
import 'package:cook/pages/home_page.dart';
import 'package:cook/pages/liste_de_course_page.dart';
import 'package:cook/pages/menus_page.dart';
import 'package:cook/pages/recettes_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex  = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
            title: [
              const Text("Acceuil"),
              const Text("Recettes"),
              const Text("Menus"),
              const Text("Liste de courses"),
              const Text("Cellier")
            ][_currentIndex]
        ),
        body:  [
          const HomePage(),
          const RecettesPage(),
          const MenusPage(),
          const ListeDeCoursePage(),
          const CellierPage(),
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setCurrentIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Acceuil"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_rounded),
                label: "Recettes"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: "Menus"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_grocery_store_outlined),
                label: "Liste de courses"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Cellier"
            )
          ],
        ),
      ),
    );
  }
}