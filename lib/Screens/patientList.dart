import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Widgets/widget.dart';
import 'package:http/http.dart' as http;

class PatientListScreen extends StatefulWidget {
  @override
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  List<dynamic> _patients = [];

  Future<void> _getPatients() async {
    final response = await http.get(Uri.parse('https://group10mapd713.herokuapp.com/patients'));
    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body) as Map<String, dynamic>;
      final patients = decodedResponse['patients'] as List<dynamic>;
      setState(() {
        _patients = patients;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Patient List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: _patients.map((patient) {
                  final fullName = patient['fullName'] as String;
                  final mobileNum = patient['mobileNum'].toString();
                  final email = patient['email'] as String;
                  final _id = patient['_id'] as String;
                  return textfield(context, fullName, mobileNum, email,_id);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/addPatient',
            arguments: 'Hello from the first page!',
          );
        },
        backgroundColor: Color.fromARGB(218, 0, 183, 197),
        child: const Icon(Icons.add),
      ),
    );
  }
}