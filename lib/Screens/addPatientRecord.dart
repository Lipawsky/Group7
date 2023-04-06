import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class addPatientRecord extends StatefulWidget {
  final String name;

  addPatientRecord({required this.name});

  @override
  _addPatientRecordState createState() => _addPatientRecordState();
}

class _addPatientRecordState extends State<addPatientRecord> {
  final _bloodPressureController = TextEditingController();
  final _respiratoryRateController = TextEditingController();
  final _oxygenLevelController = TextEditingController();
  final _heartbeatRateController = TextEditingController();

  @override
  void dispose() {
    _bloodPressureController.dispose();
    _respiratoryRateController.dispose();
    _oxygenLevelController.dispose();
    _heartbeatRateController.dispose();
    super.dispose();
  }

  Future<void> _addRecord() async {
    final url = Uri.parse('https://group10mapd713.herokuapp.com/patients/addRecord');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      "patientId": widget.name,
      "heartbeatRate": _heartbeatRateController.text,
      "oxygenLevel": _oxygenLevelController.text,
      "respiratoryRate": _respiratoryRateController.text,
      "bloodPressure": _bloodPressureController.text,
    });
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      Navigator.of(context).pushNamed('/patientRecord',arguments: {
                  "_id": widget.name
                });
    } else {
      // 处理错误情况
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Patient Record"),
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
                controller: _bloodPressureController,
                decoration: InputDecoration(
                  labelText: 'Blood Pressure',
                  hintText: 'Enter blood pressure',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
              child: TextField(
                controller: _respiratoryRateController,
                decoration: InputDecoration(
                  labelText: 'Respiratory Rate',
                  hintText: 'Enter Respiratory Rate',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
              child: TextField(
                controller: _oxygenLevelController,
                decoration: InputDecoration(
                  labelText: 'Blood Oxygen Level',
                  hintText: 'Enter blood oxygen level',
                ),
              ),
            ),
              Padding(
padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
child: TextField(
controller: _heartbeatRateController,
decoration: InputDecoration(
labelText: 'Heartbeat Rate',
hintText: 'Enter heartbeat rate',
),
),
),
const SizedBox(
          height: 20,
        ),

        ElevatedButton(
          onPressed: _addRecord,
          child: Text('Add Record'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),

      ],
    ),
  ),
);
}
}