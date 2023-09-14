import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:premier_projet/pages/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text(
            "Bienvenue ! <3",
            style: TextStyle(
              fontSize: 42,
              fontFamily: 'Poppins',
            ),
          ),
          const Text(
            "Ceci sont les premiers pas de Cyril sur Flutter",
            // Correction ici
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          SvgPicture.asset(
            "assets/images/cowboy.svg",
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}