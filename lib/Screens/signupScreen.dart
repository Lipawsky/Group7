import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('lib/Assets/ambulance-cross-hospital-icon-11.png')),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 0),
              child: TextField(
                controller: _usernameController,
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
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),

            const SizedBox(
              height: 150,
            ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () async {
                  String username = _usernameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  Map<String, dynamic> data = {
                    "userName": username,
                    "password": password,
                    "email": email
                  };

                  var response = await http.post(
                    Uri.parse("https://group10mapd713.herokuapp.com/doctor/signup"),
                    headers: {"Content-Type": "application/json"},
                    body: json.encode(data),
                  );

                  String jsonString = response.body;
                  Map<String, dynamic> jsonData = json.decode(jsonString);
                  int statusCode = jsonData['statusCode'];

                  if (statusCode == 200) {
                    Navigator.of(context).pushNamed(
                      '/login',
                      arguments: 'Hello from the first page!',
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Registration Failed"),
                          content: Text("This email has already been registered."),
                          actions: <  
                          Widget>[
TextButton(
child: Text("OK"),
onPressed: () {
Navigator.of(context).pop();
},
)
],
);
},
);
}
},
child: Text(
'Sign up',
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