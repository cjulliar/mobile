import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _secondPageState();
}

class _secondPageState extends State<SecondPage> {

  final events = [
    {
      "speaker": "Luffy",
      "date": "13h00  à 13h30",
      "subject": "les valeurs d'un pirate",
      "avatar": "onePieceFlag"
    },
    {
      "speaker": "Zorra",
      "date": "13h30  à 16h00",
      "subject": "la base de l'escrime",
      "avatar": "onePieceFlag"
    },
    {
      "speaker": "Namy",
      "date": "16h00  à 18h30",
      "subject": "l'orientation ",
      "avatar": "onePieceFlag"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              final avatar = event['avatar'];
              final speaker = event['speaker'];
              final subject = event['subject'];
              final date = event['date'];

              return Card(
                child: ListTile(
                  leading: Image.asset("assets/images/$avatar.png"),
                  title: Text("Cours sur $subject ($date)"),
                  subtitle: Text("Presenté par $speaker"),
                  trailing: Icon(Icons.more_vert),
                ),
              );

            }

        )
    );
  }
}
