import 'dart:convert';
// import 'dart:ffi';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controllers/ScholarshipController.dart';
import '../controllers/Student_Controller.dart';
import '../controllers/Transaction_Controller.dart';

class dbhelper {
  static const String url = 'http://192.168.18.11:80/api';
  static late String email;
  late String name;
  static late String balance;
  final StudentController studentController = Get.put(StudentController());
  // final StudentController studentController2 = Get.find<StudentController>();

  final TransactionController transactionController =
      Get.put(TransactionController());
  final ScholarshipController scholarshipController =
      Get.put(ScholarshipController());

  Future<http.Response> getStudentbyId(String id) async {
    var response =
        await http.get(Uri.parse('$url/Student/getstudentbyId?id=$id'));
    print("${response.statusCode}");
    return response;
  }

  void getScholarships() {
    Future s = scholarshipController.getAllScholarships();
    s.then((value) => {
          if (value.statusCode == 200)
            {
              print("Scholarships Fetched"),
            }
        });
  }

  Future<http.Response> AccountVerification(
      String emailController, String passwordController) async {
    Map data = {
      'email': '$emailController',
      'password': '$passwordController',
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
      Uri.parse(url + '/Login/AccountVerification'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      var res = await studentController.getAllStudents();
      var res1 = await transactionController.getAllTransactions();
      getScholarships();

      return response;
    }
    print("${response.statusCode}");
    return response;
  }

  Future<http.Response> depositMoney(String id, String amount) async {
    var response = await http.post(
      Uri.parse("${url}/Transactions/depositMoney?id=$id&amount=$amount"),
    );
    print("${response.statusCode}");
    return response;
  }

  Future<http.Response> postLoan(String id, String amount, String reason) {
    Map data = {
      'studentId': '$id',
      'amount': '$amount',
      'desc': '$reason',
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = http.post(
      Uri.parse("${url}/Loan/postLoan"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    return response;
  }
}
