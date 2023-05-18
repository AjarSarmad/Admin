import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/ScholarshipController.dart';
import '../models/Scholarship.dart';
import '../screens/home.dart';

class scholarshipDB extends StatefulWidget {
  @override
  State<scholarshipDB> createState() => _scholarshipDB();
}

class _scholarshipDB extends State<scholarshipDB> {
  final List<String> headers = [
    'ID',
    'CGPA',
    'Department',
    'Document',
    'Guardian Name',
    'Guardian Contact',
    'Semester',
  ];

  final ScholarshipController scholarshipController =
      Get.find<ScholarshipController>();

  @override
  Widget build(BuildContext context) {
    final List<Scholarship> scholarships = scholarshipController
        .scholarship.value; // Add your scholarship data here

    // Determine the maximum number of columns in any row
    int maxColumns = headers.length;
    for (var scholarship in scholarships) {
      int scholarshipColumns = headers.toList().length;
      if (scholarshipColumns > maxColumns) {
        maxColumns = scholarshipColumns;
      }
    }

    List<TableRow> tableRows = scholarships.map((scholarship) {
      List<String> scholarshipData = [
        scholarship.id.toString(),
        scholarship.cgpa.toString(),
        scholarship.department.toString(),
        scholarship.document.toString(),
        scholarship.guardianName.toString(),
        scholarship.guardianContact.toString(),
        scholarship.semester.toString(),
      ];

      // Pad the row with empty cells if the number of columns is less than maxColumns
      if (scholarshipData.length < maxColumns) {
        int paddingCount = maxColumns - scholarshipData.length;
        scholarshipData.addAll(List.filled(paddingCount, ''));
      }

      return TableRow(
        children: scholarshipData.map((data) {
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
          "Scholarship Database",
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
