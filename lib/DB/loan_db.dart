import 'package:flutter/material.dart';

import '../screens/home.dart';

class loanDB extends StatefulWidget {
  @override
  State<loanDB> createState() => _loanDB();
}

class _loanDB extends State<loanDB> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final List<List<String>> data = [
    [
      'Student ID',
      'Amount',
      'Description',
    ],
    [
      'Data 2-1',
      'Data 2-2',
      'Data 2-3',
    ],
    [
      'Data 3-1',
      'Data 3-2',
      'Data 3-3',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    List<TableRow> tableRows = data.asMap().entries.map((entry) {
      int rowIndex = entry.key;
      List<String> row = entry.value;

      List<TableCell> tableCells = row.asMap().entries.map((entry) {
        // int cellIndex = entry.key;
        String cellValue = entry.value;

        TextStyle cellTextStyle = TextStyle(
            fontWeight: rowIndex == 0 ? FontWeight.bold : FontWeight.normal,
            fontSize: rowIndex == 0 ? 18 : 15);

        return TableCell(
          child: Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              cellValue,
              style: cellTextStyle,
            ),
          )),
        );
      }).toList();

      return TableRow(children: tableCells);
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
                context, MaterialPageRoute(builder: (context) => Home())),
          ),
        ),
        body: Table(
            border: TableBorder.all(),
            defaultColumnWidth: FixedColumnWidth(120.0),
            children: tableRows));
  }
}
