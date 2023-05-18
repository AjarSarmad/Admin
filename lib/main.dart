import 'package:admin/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/Student_Controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: StudentBinding2(),
      home: login(),
    );
  }
}
