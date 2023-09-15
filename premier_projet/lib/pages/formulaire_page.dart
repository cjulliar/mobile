import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class FormulairePage extends StatefulWidget {
  const FormulairePage({super.key});

  @override
  State<FormulairePage> createState() => _FormulairePageState();
}

class _FormulairePageState extends State<FormulairePage> {

  final _formKey = GlobalKey<FormState>();

  final confNameController = TextEditingController();
  final professorNameController = TextEditingController();
  String selectedCategorieHuman = 'Civile';
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    confNameController.dispose();
    professorNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Nom cours",
                      hintText: "Entrez le nom du cours",
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return "Text incomplet !";
                    }
                    return null;
                  },
                  controller: confNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Nom professeur",
                      hintText: "Entrez le nom du professeur",
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return "Text incomplet !";
                    }
                    return null;
                  },
                  controller: professorNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom:20),
                child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(value: 'Pirate', child: Text("Pirate de grandLine")),
                      DropdownMenuItem(value: 'Marine', child: Text("Membre de la marine")),
                      DropdownMenuItem(value: 'Civile', child: Text("Citoyen des cotes")),
                    ],
                    decoration: const InputDecoration(
                        border: OutlineInputBorder()
                    ),
                    value: selectedCategorieHuman ,
                    onChanged: (value){
                      setState(() {
                        selectedCategorieHuman = value!;
                      });
                    }
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom:20),
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Choisir une date',
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    setState((){
                      selectedConfDate = value;
                    });
                    //print(value);
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()){
                        final confName = confNameController.text;
                        final profName = professorNameController.text;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("envoi en cours"))
                        );
                        FocusScope.of(context).requestFocus(FocusNode());

                        // ajout dans la bdd
                        CollectionReference eventsRef = FirebaseFirestore.instance.collection("Events");
                        eventsRef.add({
                          'speaker' : profName,
                          'date' : selectedConfDate,
                          'subject': confName,
                          'type': selectedCategorieHuman,
                          'avatar': 'onePieceFlag'
                        });
                      }
                    },
                    child: const Text("Enregistrer")),
              )
            ],
          )
      ),
    );
  }
}

