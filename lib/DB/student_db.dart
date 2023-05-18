import 'package:admin/controllers/Student_Controller.dart';
import 'package:admin/controllers/dbhelper.dart';
import 'package:admin/models/student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home.dart';

class studentDB extends StatefulWidget {
  @override
  State<studentDB> createState() => _studentDB();
}

class _studentDB extends State<studentDB> {
  final List<String> headers = [
    'Student ID',
    'Account No',
    'Address',
    'Balance',
    'Contact',
    'Email',
    'First Name',
    'Last Name',
    'Guardian Name',
    'Guardian Contact',
    // 'Scholarship Holder',
  ];

  final StudentController studentController = Get.find<StudentController>();

  @override
  Widget build(BuildContext context) {
    final List<Student> students =
        studentController.students.value; // Add your student data here

    // Determine the maximum number of columns in any row
    int maxColumns = headers.length;
    for (var student in students) {
      int studentColumns = headers.toList().length;
      if (studentColumns > maxColumns) {
        maxColumns = studentColumns;
      }
    }

    List<TableRow> tableRows = students.map((student) {
      List<String> studentData = [
        student.nu_id.toString(),
        student.accountNo.toString(),
        student.address.toString(),
        student.balance.toString(),
        student.contact.toString(),
        student.email.toString(),
        student.firstName.toString(),
        student.lastName.toString(),
        student.guardianFullName.toString(),
        student.guardianContact.toString(),
        // student.toString(),
      ];

      // Pad the row with empty cells if the number of columns is less than maxColumns
      if (studentData.length < maxColumns) {
        int paddingCount = maxColumns - studentData.length;
        studentData.addAll(List.filled(paddingCount, ''));
      }

      return TableRow(
        children: studentData.map((data) {
          return TableCell(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(data),
              ),
            ),
          );
        }).toList(),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFD44C66),
        title: Text(
          "Student Database",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          ),
        ),
      ),
      body: ListView(
        children: [
          Table(
            border: TableBorder.all(),
            defaultColumnWidth: FixedColumnWidth(120.0),
            children: [
              TableRow(
                children: headers.map((header) {
                  return TableCell(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          header,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              ...tableRows,
            ],
          ),
        ],
      ),
    );
  }
}
