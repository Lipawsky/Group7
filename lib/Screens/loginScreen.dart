import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _login() async {
    // 构建JSON负载
    final payload = {
      "userName": usernameController.text,
      "password": passwordController.text
    };
    // 发送POST请求
    final response = await http.post(
      Uri.parse('https://group10mapd713.herokuapp.com/doctor/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
        'Accept': '*/*',
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
        
      },
      
      body: jsonEncode(payload),
    );

    String jsonString = response.body;
    Map<String, dynamic> jsonData = json.decode(jsonString);

    int statusCode = jsonData['statusCode'];

    // 根据响应的状态码判断是否成功登录
    if (statusCode == 200 ) {
      // 成功登录，跳转到新页面
      Navigator.of(context).pushNamed(
        '/patientList',
        arguments: 'Hello from the first page!',
      );
    } else {
      // 登录失败，弹出对话框提示
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Invalid username or password."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
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
                  child:
                      Image.asset('lib/Assets/ambulance-cross-hospital-icon-11.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter valid Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: _login, // 调用登录方法
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent
                ),
            onPressed: () {
              Navigator.of(context).pushNamed(
              '/signup',
              arguments: 'Hello from the first page!',
      );
            },
             child: const Text(
            'New User',
style: TextStyle(fontSize: 15, color: Colors.blue),
),
),
],
),
),
);
}
}