import 'package:flutter/material.dart';
import 'package:premier_projet/pages/formulaire_page.dart';
import 'package:premier_projet/pages/home_page.dart';
import 'package:premier_projet/pages/second_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
            const Text("Index"),
            const Text("Liste des cours"),
            const Text("Formulaire")
          ][_currentIndex]
        ),
        body:  [
          const HomePage(),
          const SecondPage(),
          const  FormulairePage()
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
                icon: Icon(Icons.calendar_month),
                label: "Agenda"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "Ajout"
            )
          ],
        ),
      ),
    );
  }
}
