import 'package:admin/DB/loan_db.dart';
import 'package:admin/DB/scholarship_db.dart';
import 'package:admin/DB/student_db.dart';
import 'package:admin/DB/transaction_db.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFD44C66),
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(20),
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 2),
          children: [
            _buildButton(context, 'STUDENT DB', Icons.man, studentDB()),
            _buildButton(
                context, 'TRANSACTION DB', Icons.double_arrow, transactionDB()),
            _buildButton(
                context, 'SCHOLARSHIP DB', Icons.school, scholarshipDB()),
            _buildButton(context, 'LOAN DB', Icons.credit_card, loanDB()),
          ],
        ),
      ),
    );
  }

  static Widget _buildButton(
      BuildContext context, String label, IconData icon, Widget onPressed) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => onPressed),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFD44C66),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48),
          SizedBox(height: 16),
          Text(
            label,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
