import 'package:flutter/material.dart';

Widget textfield(BuildContext context)
  {
    return GestureDetector(
      onTap: () {
          Navigator.of(context).pushNamed(
                  '/patientInformation',
                );
      },

      child: Column(
                        children: [
                      
                          Row(
                        children: [
                          SizedBox(width: 20,),
                          Container(
                          width: 50,
                          height: 100,
                      /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                          child: Image.asset('lib/Assets/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg')
                          ),
                          SizedBox(width: 40,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Jhon Doe",style: TextStyle(
                                fontSize: 20,
                                color:Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold
                                ),),
                                
                                SizedBox(height: 2,),


                              Text("4379730528",style: TextStyle(
                                fontSize: 15,
                                color:Color.fromARGB(168, 0, 0, 0),
                                ),),


                                SizedBox(height:2,),
                              Text("satddddu7@gmail.com",style: TextStyle(
                                fontSize: 12,
                                color:Color.fromARGB(85, 0, 0, 0),
                                ),),

                            ],
                          ),
                          
                         
                          const Expanded(child: SizedBox()),//自动扩展挤压

                          const Icon(
                            Icons.arrow_forward_ios,
                            
                          )
                        ],
                      ),
    
                          const Divider(indent: 20.0,endIndent: 10.0,thickness: 1,),
                        ],
                      ),
    );
  }
