import 'package:flutter/material.dart';
import '../Widgets/widget.dart';

class PatientListScreen extends StatefulWidget {
  @override
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Patient List"),
      ),
      body: 
       Column(
         children: [
          Expanded(
           child: SingleChildScrollView(
            child:Column(
              
              children:  [
             textfield(context),
             textfield(context),
             textfield(context),
             textfield(context),
             textfield(context),
             textfield(context),
             textfield(context),
             textfield(context),
             textfield(context),
             textfield(context),
             textfield(context),
             textfield(context),
                
                
                
            ],),
         
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