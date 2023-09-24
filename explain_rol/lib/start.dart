import 'dart:convert';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:explain_rol/narration.dart';
import 'package:flutter/material.dart';

class DataForm extends StatefulWidget {
  const DataForm({super.key});

  @override
  State<DataForm> createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var toSend = {
    "name": "Farhat",
    "race": "goblin",
    "action": "hit the enemy throwing an arrow with the hand",
    "dice": "1",
    "difficulty": "1"
  };
  @override
  Widget build(BuildContext context) {
    var diceVal = 1;
    var difficultyVal = 1;
    // var response;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AssetImage("img/background.jpeg"),
            Image.asset(
              "img/icn.png",
              fit: BoxFit.fill,
              height: 50,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('ActionArtisan'))
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("img/background.jpeg"),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Center(child: Text("ad")),
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (newValue) =>
                              {toSend["name"] = newValue.toString()},
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person_outline_sharp),
                            hintText: 'Name',
                            helperText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                        )),
                        Flexible(
                            child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (newValue) =>
                              {toSend["race"] = newValue.toString()},
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person_3),
                            hintText: 'Race',
                            helperText: 'Race',
                            border: OutlineInputBorder(),
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Flexible(
                            child: DropdownButtonFormField(
                          onSaved: (newValue) =>
                              {toSend["difficulty"] = newValue.toString()},
                          decoration: const InputDecoration(
                            icon: Icon(Icons.menu_book_rounded),
                            hintText: 'Dificulty',
                            helperText: 'Dificulty',
                            border: OutlineInputBorder(),
                          ),
                          isExpanded: true,
                          hint: const Text("Dificulty num"),
                          items: const [
                            DropdownMenuItem<int>(value: 1, child: Text("1")),
                            DropdownMenuItem(value: 2, child: Text("2")),
                            DropdownMenuItem(value: 3, child: Text("3")),
                            DropdownMenuItem(value: 4, child: Text("4")),
                            DropdownMenuItem(value: 5, child: Text("5")),
                            DropdownMenuItem(value: 6, child: Text("6")),
                            DropdownMenuItem(value: 7, child: Text("7")),
                            DropdownMenuItem(value: 8, child: Text("8")),
                            DropdownMenuItem(value: 9, child: Text("9")),
                            DropdownMenuItem(value: 10, child: Text("10")),
                            DropdownMenuItem(value: 11, child: Text("11")),
                            DropdownMenuItem(value: 12, child: Text("12")),
                            DropdownMenuItem(value: 13, child: Text("13")),
                            DropdownMenuItem(value: 14, child: Text("14")),
                            DropdownMenuItem(value: 15, child: Text("15")),
                            DropdownMenuItem(value: 16, child: Text("16")),
                            DropdownMenuItem(value: 17, child: Text("17")),
                            DropdownMenuItem(value: 18, child: Text("18")),
                            DropdownMenuItem(value: 19, child: Text("19")),
                            DropdownMenuItem(value: 20, child: Text("20"))
                          ],
                          value: difficultyVal,
                          onChanged: (value) {
                            difficultyVal = value!;
                            setState(() {});
                          },
                        )),
                        Flexible(
                            child: DropdownButtonFormField(
                          onSaved: (newValue) =>
                              {toSend["dice"] = newValue.toString()},
                          decoration: const InputDecoration(
                            icon: Icon(Icons.casino_rounded),
                            hintText: 'Dice Number',
                            helperText: 'Final Modificator',
                            border: OutlineInputBorder(),
                          ),
                          isExpanded: true,
                          hint: const Text("Dice num"),
                          items: const [
                            DropdownMenuItem<int>(value: 1, child: Text("1")),
                            DropdownMenuItem(value: 2, child: Text("2")),
                            DropdownMenuItem(value: 3, child: Text("3")),
                            DropdownMenuItem(value: 4, child: Text("4")),
                            DropdownMenuItem(value: 5, child: Text("5")),
                            DropdownMenuItem(value: 6, child: Text("6")),
                            DropdownMenuItem(value: 7, child: Text("7")),
                            DropdownMenuItem(value: 8, child: Text("8")),
                            DropdownMenuItem(value: 9, child: Text("9")),
                            DropdownMenuItem(value: 10, child: Text("10")),
                            DropdownMenuItem(value: 11, child: Text("11")),
                            DropdownMenuItem(value: 12, child: Text("12")),
                            DropdownMenuItem(value: 13, child: Text("13")),
                            DropdownMenuItem(value: 14, child: Text("14")),
                            DropdownMenuItem(value: 15, child: Text("15")),
                            DropdownMenuItem(value: 16, child: Text("16")),
                            DropdownMenuItem(value: 17, child: Text("17")),
                            DropdownMenuItem(value: 18, child: Text("18")),
                            DropdownMenuItem(value: 19, child: Text("19")),
                            DropdownMenuItem(value: 20, child: Text("20"))
                          ],
                          value: diceVal,
                          onChanged: (value) {
                            diceVal = value!;
                            setState(() {});
                          },
                        ))
                      ],
                    ),
                    const SizedBox(height: 15),
                    Flexible(
                        child: TextFormField(
                      onSaved: (newValue) =>
                          {toSend["action"] = newValue.toString()},
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.type_specimen_rounded),
                        hintText: 'jump over a cliff',
                        prefixText: "Tried to ",
                        helperText: 'Action',
                        border: OutlineInputBorder(),
                      ),
                    )),
                    ElevatedButton(
                      child: const Text("Give me a Narration"),
                      // onPressed: () => {Navigator.pushNamed(context, '/narration')},
                      onPressed: () async => {
                        if (_formKey.currentState!.validate())
                          {
                            _formKey.currentState?.save(),
                            // print(to_send),
                            // response = futureRequestMethod(to_send),
                            // print('Response status: ${response.statusCode}'),
                            // print('Response body: ${response.body}'),

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NarrationScene(
                                    narration: futureRequestMethod,
                                    valu: toSend),
                              ),
                            ),
                          },
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future futureRequestMethod(Map<String, String> toSend) async {
  // here is the code that you will request the data with in the end as example:
  // dotenv.env['VAR_NAME'];
  var url = Uri.https(
    const String.fromEnvironment('API_AUTHORITY', defaultValue: ''),
    const String.fromEnvironment('API_PATH', defaultValue: ''),
  );

  var response = await http.post(url,
      headers: {
        "X-Api-Key": const String.fromEnvironment('API_KEY', defaultValue: ''),
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "name": toSend['name'],
        "race": toSend['race'],
        "action": toSend['action'],
        "dice": toSend['dice'],
        "difficulty": toSend['difficulty']
      }));

  // final resultOfRequest = snapshot.data;

  return response;
}
