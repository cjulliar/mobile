import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _secondPageState();
}

class _secondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder(
          stream:  FirebaseFirestore.instance.collection("Events").where('type', isEqualTo: 'pirate').snapshots(), //.orderBy('date', descending: true)
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (!snapshot.hasData) {
              return Text("Aucune conferences");
            }

            List<dynamic> events = [];
            snapshot.data!.docs.forEach((element) {
              events.add(element);
            });

            return ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  final avatar = event['avatar'];
                  final speaker = event['speaker'];
                  final subject = event['subject'];
                  final Timestamp timestamp = event['date'];
                  final String date = DateFormat.yMd().add_jm().format(timestamp.toDate());

                  return Card(
                    child: ListTile(
                      leading: Image.asset("assets/images/$avatar.png"),
                      title: Text("Cours sur $subject ($date)"),
                      subtitle: Text("Presenté par $speaker"),
                      trailing: Icon(Icons.more_vert),
                    ),
                  );

                },
            );
          },
        )
    );
  }
}
