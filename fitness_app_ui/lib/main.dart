
import 'package:fitness_app_ui/pages/membership_form.dart';
import 'package:fitness_app_ui/pages/select_plan.dart';
import 'package:fitness_app_ui/tabs/tabs.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Geometria'),
      home:  Scaffold(
        body: Membershipform(),
      ),
    );
  }
}




