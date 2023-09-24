import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:http/http.dart' as http;

class NarrationScene extends StatelessWidget {
  final Future<dynamic> Function(Map<String, String>) narration;
  final Map<String, String> valu;

  const NarrationScene(
      {super.key, required this.narration, required this.valu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Narration'),
      ),
      body: FutureBuilder(
          future: narration(valu),
          builder: (context, snapshot) {
            // Here you told Flutter to use the word "snapshot".
            if (snapshot.hasData) {
              // print("Data snapshot");
              // print(snapshot.data.toString());
              var dta = jsonDecode(((snapshot.data) as Response).body);
              return NarrationOk(narrationn: dta['content'].toString());
            } else {
              return const Center(
                  child: Column(
                children: [
                  Text("Usually takes 10s"),
                  CircularProgressIndicator(),
                ],
              ));
            }
          }),
    );
  }
}

class CancelAPI extends StatelessWidget {
  const CancelAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NarrationOk extends StatelessWidget {
  final String narrationn;
  const NarrationOk({super.key, this.narrationn = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical, child: Text(narrationn)),
            ),
            // Flexible(child: Center(child: Text(narration))),
            ElevatedButton(
              child: const Text("Back"),
              onPressed: () => {Navigator.pop(context, '/')},
            ),
          ],
        ),
      ),
    );
  }
}
