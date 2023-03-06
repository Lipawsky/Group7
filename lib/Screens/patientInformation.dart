import 'package:flutter/material.dart';
import '../Widgets/widget.dart';

class patientInformation extends StatefulWidget {
  @override
  _patientInformationState createState() => _patientInformationState();
}

class _patientInformationState extends State<patientInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Patient Information"),
      ),
      body: 
       SingleChildScrollView(
        child:Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 1000,
                width: double.infinity,
                child: Column(
                  
                  children:  [
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
                          child: Image.asset('lib/Assets/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg')),
                
                          const Text("John Doe",style: TextStyle(
                                  fontSize: 15,
                                  color:Color.fromARGB(168, 0, 0, 0),
                                  ),),
                          
                          const Divider(indent: 70.0,endIndent: 70.0,thickness: 1,),
                          const SizedBox(height: 30,),
                
                          textInfo("email:","satddddu7@gmail.com"),
                          textInfo("Phone Number:","4379730528"),
                          textInfo("Age:","23"),
                          textInfo("Blood Group:","A1"),
                          textInfo("Address:","190 Borough"),
                          SizedBox(height: 100,),
                          
                          Button1(context),

                          
                
                
                
                    ],
                  ),
                ),
              ),

                 
                    
                    
                    

                ],)
              ),

        )

    
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
Widget Button1(BuildContext context)
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
                  '/patientRecord',
                  arguments: 'Hello from the first page!',
                );
                },
                child: const Text(
                  'View Record',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  
                ),
              ),
            );
}