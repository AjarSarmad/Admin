import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/Transaction_Controller.dart';
import '../models/transaction.dart';
import '../screens/home.dart';

class transactionDB extends StatefulWidget {
  @override
  State<transactionDB> createState() => _transactionDB();
}

class _transactionDB extends State<transactionDB> {
  final List<String> headers = [
    'Transaction ID',
    'Amount',
    'Sender Name',
    'Receiver Name',
    'sender ID',
    'receiver ID',
    'sender Account No',
    'receiver Account No',
    'Date',
    'Time',
    'Note',
    'Type',
  ];

  final TransactionController transactionController =
      Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = transactionController
        .transactions.value; // Add your transaction data here

    // Determine the maximum number of columns in any row
    int maxColumns = headers.length;
    for (var transaction in transactions) {
      int transactionColumns = headers.toList().length;
      if (transactionColumns > maxColumns) {
        maxColumns = transactionColumns;
      }
    }

    List<TableRow> tableRows = transactions.map((transaction) {
      List<String> transactionData = [
        transaction.id.toString(),
        transaction.amount.toString(),
        transaction.senderName.toString(),
        transaction.recieverName.toString(),
        transaction.senderId.toString(),
        transaction.recieverId.toString(),
        transaction.senderAccount.toString(),
        transaction.recieverAccount.toString(),
        transaction.date.toString(),
        transaction.time.toString(),
        transaction.note.toString(),
        transaction.type.toString(),
      ];

      // Pad the row with empty cells if the number of columns is less than maxColumns
      if (transactionData.length < maxColumns) {
        int paddingCount = maxColumns - transactionData.length;
        transactionData.addAll(List.filled(paddingCount, ''));
      }

      return TableRow(
        children: transactionData.map((data) {
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
          "Transaction Database",
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
