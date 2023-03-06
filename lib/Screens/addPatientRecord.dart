import 'package:flutter/material.dart';



class addPatientRecord extends StatefulWidget {
  @override
  _addPatientRecordState createState() => _addPatientRecordState();
}

class _addPatientRecordState extends State<addPatientRecord> {
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


            const Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Blood Pressure',
                    hintText: 'Enter blood pressure'),
              ),
            ),


            const Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Respiratory Rate',
                    hintText: 'Enter Respiratory Rate'),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Blood Oxygen Level',
                    hintText: 'Enter blood oxygen level'),
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Heartbeat Rate',
                    hintText: 'Enter heartbeat Rate'),
              ),
            ),


            
            const SizedBox(
              height: 40,
            ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                
                  color: Color.fromARGB(0, 255, 255, 255), borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(

                 style:ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(148, 0, 0, 0)
                ),

                onPressed: () {
                  Navigator.of(context).pushNamed(
                  '/patientRecord',
                  arguments: 'Hello from the first page!',
                );
                },
                child: const Text(
                  'Add Record',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}