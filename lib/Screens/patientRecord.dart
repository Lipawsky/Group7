import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class patientRecord extends StatefulWidget {
  final String name;

  patientRecord({required this.name});
  @override
  _patientRecordState createState() => _patientRecordState();
}

class _patientRecordState extends State<patientRecord> {
  List<Record> records = [];

  Future<void> getRecords() async {
    final response = await http.post(
      Uri.parse('https://group10mapd713.herokuapp.com/patients/getRecords'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'patientId': widget.name}),
    );
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      List<dynamic> recordsJson = responseData['records'];
      records = recordsJson.map((record) => Record.fromJson(record)).toList();
      setState(() {});
    } else {
      throw Exception('Failed to load records');
    }
  }

  @override
  void initState() {
    super.initState();
    getRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Patient Record"),
      ),
      body: records.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  for (var i = 0; i < records.length; i++)
                    textColumn(
                      records[i].bloodPressure,
                      records[i].respiratoryRate,
                      records[i].oxygenLevel,
                      records[i].heartbeatRate,
                    ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/addPatientRecord',
            arguments: {
                  "_id": widget.name
                }
          );
        },
        backgroundColor: Color.fromARGB(218, 0, 183, 197),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Record {
  final String id;
  final String patientId;
  final String bloodPressure;
  final String respiratoryRate;
  final String oxygenLevel;
  final String heartbeatRate;
  final String date;

  Record({
    required this.id,
    required this.patientId,
    required this.bloodPressure,
    required this.respiratoryRate,
    required this.oxygenLevel,
    required this.heartbeatRate,
    required this.date,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['_id'],
      patientId: json['patientId'],
      bloodPressure: json['bloodPressure'],
      respiratoryRate: json['respiratoryRate'],
      oxygenLevel: json['oxygenLevel'],
      heartbeatRate: json['heartbeatRate'],
      date: json['date'],
    );
  }
}


Widget textColumn(String bloodpressure,String respiratoryRate,String oxygenLevel,String heartbeatRate )
{
  return Column(
    children: [
      textInfo("Blood Pressure", bloodpressure),
      textInfo("Respiratory Rate", respiratoryRate),
      textInfo("Oxygen Level", oxygenLevel),
      textInfo("Heartbeat Rate", heartbeatRate),
      const Divider(indent: 0.0,endIndent: 0.0,thickness: 2,),
      SizedBox(height: 20,)

    ],
  );
}
Widget textInfo(String item,String content)
{
  return Padding(
    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
    child: Row(
                              children:  [
                                Text(item,style: const TextStyle(
                                  fontSize: 20,
                                  color:Color.fromARGB(200, 0, 0, 0),
                                  ),),
                                  
                                const Expanded(child: SizedBox()),
  
                                Text(content,style: const TextStyle(
                                  fontSize: 15,
                                  color:Color.fromARGB(135, 0, 0, 0),
                                  ),),
  
                                  const SizedBox(height: 10,)
                              ],
                            ),
  );
}