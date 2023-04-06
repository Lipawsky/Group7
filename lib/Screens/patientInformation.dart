import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Widgets/widget.dart';

class PatientInformation extends StatefulWidget {
  final String name;

  PatientInformation({required this.name});

  @override
  _PatientInformationState createState() => _PatientInformationState();
}

class _PatientInformationState extends State<PatientInformation> {
  String name = "John Doe";
  String? fullName;
  String? email;
  int? mobileNum;
  int? age;
  String? bloodType;
  String? address;
  String? doctorId;
  String? date;

  @override
  void initState() {
    super.initState();
    // 发送请求获取患者信息
    fetchPatientInfo();
  }

  Future<void> fetchPatientInfo() async {
    final url = Uri.https('group10mapd713.herokuapp.com', '/patients/detail');
    final response = await http.post(
      url,
      body: json.encode({'patientId': widget.name}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        fullName = data['patient']['fullName'];
        email = data['patient']['email'];
        mobileNum = data['patient']['mobileNum'];
        age = data['patient']['age'];
        bloodType = data['patient']['bloodType'];
        address = data['patient']['address'];
        doctorId = data['patient']['doctorId'];
        date = data['patient']['date'];
      });
    } else {
      throw Exception('Failed to fetch patient info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Patient Information"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          height: 1000,
          width: double.infinity,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        /*decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset(
                            'lib/Assets/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                      ),
                      Text(
                        fullName ?? '',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(168, 0, 0, 0),
                        ),
                      ),
                      const Divider(
                        indent: 70.0,
                        endIndent: 70.0,
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      textInfo("email:", email ?? ''),
                      textInfo("Phone:", mobileNum?.toString() ?? ''),
                      textInfo("Age:", age?.toString() ?? ''),
                      textInfo("Blood Group:", bloodType ?? ''),
                      textInfo("Address:", address ?? ''),
                      SizedBox(
                        height: 100,
                      ),
                      Button1(context,widget.name),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget textInfo(String item,String content)
{
  return Row(
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
                          );
}
Widget Button1(BuildContext context,String _id)
{
  return Container(
              height: 40,
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(148, 0, 0, 0)
                ),
          
                onPressed: () {
                  Navigator.of(context).pushNamed(
                  '/patientRecord',arguments: {
                  "_id": _id
                }
                );
                },
                child: const Text(
                  'View Record',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  
                ),
              ),
            );
}