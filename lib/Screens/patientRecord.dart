import 'package:flutter/material.dart';

class patientRecord extends StatefulWidget {
  @override
  _patientRecordState createState() => _patientRecordState();
}

class _patientRecordState extends State<patientRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Patient Record"),
      ),
      body: 
       Column(
         children: [
           Expanded(
             child: SingleChildScrollView(
              child:Column(
                
                children:  [
                  Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Column(
                  children: [
                    
                        

                        const SizedBox(height: 30,),
                        
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),
                        textColumn(80.toString(), 80.toString(),80.toString(), 80.toString()),

              

                        SizedBox(height: 100,),
                        

              
              
              
                  ],
                ),
              ),
                    ),
           
               
                  
                  
                  
           
              ],),
           
              ),
           ),
         ],
       ),

      
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
                  '/addPatientRecord',
                  arguments: 'Hello from the first page!',
                );
        },
        backgroundColor: Color.fromARGB(218, 0, 183, 197),
        child: const Icon(Icons.add),
      ),
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