import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class addPatient extends StatefulWidget {
  @override
  _addPatientState createState() => _addPatientState();
}

class _addPatientState extends State<addPatient> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future<void> _addPatient() async {
    final url = Uri.parse('https://group10mapd713.herokuapp.com/addpatients');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "fullName": _fullNameController.text,
        "email": _emailController.text,
        "mobileNum": int.parse(_mobileNumController.text),
        "age": int.parse(_ageController.text),
        "bloodType": _bloodTypeController.text,
        "address": _addressController.text,
        "doctorId": "Doctor_1"
      }),
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pushNamed(
        '/patientList',
        arguments: 'Hello from the first page!',
      );
    } else {
      throw Exception('Failed to add patient.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Patient"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                    width: 100,
                    height: 100,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('lib/Assets/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg')),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
              child: TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter valid username as John Doe'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
              child: TextField(
                controller: _mobileNumController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    hintText: 'Enter phone number'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
child: TextField(
controller: _ageController,
decoration: InputDecoration(
prefixIcon: Icon(Icons.calendar_today),
border: OutlineInputBorder(),
labelText: 'Age',
hintText: 'Enter age'),
),
),Padding(
          padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
          child: TextField(
            controller: _bloodTypeController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.local_hospital),
                border: OutlineInputBorder(),
                labelText: 'Blood Type',
                hintText: 'Enter blood type'),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
          child: TextField(
            controller: _addressController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.home),
                border: OutlineInputBorder(),
                labelText: 'Address',
                hintText: 'Enter address'),
          ),
        ),

        const SizedBox(
          height: 30,
        ),

        ElevatedButton(
          onPressed: () {
            _addPatient();
          },
          child: const Text('Add Patient'),
        ),

        const SizedBox(
          height: 30,
        ),
      ],
    ),
  ),
);
}
}