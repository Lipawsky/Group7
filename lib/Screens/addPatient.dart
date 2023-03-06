import 'package:flutter/material.dart';



class addPatient extends StatefulWidget {
  @override
  _addPatientState createState() => _addPatientState();
}

class _addPatientState extends State<addPatient> {
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


            const Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter valid username as John Doe'),
              ),
            ),


            const Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    hintText: 'Enter phone number'),
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.elderly_woman),
                    border: OutlineInputBorder(),
                    labelText: 'Age',
                    hintText: 'Enter age'),
              ),
            ),


            const Padding(
              padding: EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.bloodtype),
                    border: OutlineInputBorder(),
                    labelText: 'Blood',
                    hintText: 'Enter blood type'),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.home),
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                    hintText: 'Enter address'),
              ),
            ),








            const SizedBox(
              height: 10,
            ),

            


            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                  '/patientList',
                  arguments: 'Hello from the first page!',
                );
                },
                child: const Text(
                  'Add patient',
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