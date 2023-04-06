import 'Screens/addPatient.dart';
import 'Screens/patientInformation.dart';
import 'Screens/signupScreen.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'Screens/loginScreen.dart';
import 'Screens/signupScreen.dart';
import 'Screens/patientList.dart';
import 'Screens/patientRecord.dart';
import 'Screens/addPatientRecord.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginDemo());
      case '/signup':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case '/patientList':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => PatientListScreen());
        
      case '/patientInformation':
        // Validation of correct data type
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => PatientInformation(name: args['_id']));
        

      case '/patientRecord':
        // Validation of correct data type
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => patientRecord(name: args['_id']));

      case '/addPatient':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => addPatient());

      case '/addPatientRecord':
        // Validation of correct data type
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => addPatientRecord(name: args['_id']));

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
