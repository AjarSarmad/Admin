import 'package:get/get.dart';
import '/models/student.dart';
import 'dbhelper.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class StudentController extends GetxController {
  static const String url = 'http://192.168.18.11:80/api';
  static late String email;
  late String name;
  static late String balance;
  late RxList<Student> students;

  @override
  void onInit() {
    super.onInit();
    students = <Student>[].obs;
    //print(student.value.accountNo);

    // fetchProducts();
  }

  Future<http.Response> getAllStudents() async {
    var response = await http.get(Uri.parse(url + '/Student/getstudents'));
    var jsonList = json.decode(response.body);

    for (var temp in jsonList) {
      Student student1 = Student(
          temp['nu_id'].toString(),
          temp['accountNo'].toString(),
          temp['balance'].toString(),
          temp['contact'].toString(),
          temp['email'].toString(),
          temp['firstName'].toString(),
          temp['lastName'].toString(),
          temp['guardianContact'].toString(),
          temp['guardianFullName'].toString(),
          temp['address'].toString(),
          temp['balance'].toString());
      students.add(student1);
    }

    print("${response.statusCode}");
    return response;
  }
  // student = Student(id: '1', name: 'John Doe', age: 20);
}

class StudentBinding2 implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentController>(() => StudentController());
  }
}
