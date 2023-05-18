import 'package:get/get.dart';
import '../models/Scholarship.dart';
import '/models/student.dart';
import 'Student_Controller.dart';
import 'dbhelper.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ScholarshipController extends GetxController {
  static const String url = 'http://192.168.18.11:80/api';
  late RxList<Scholarship> scholarship;
  // final StudentController studentController = Get.find<StudentController>();

  @override
  void onInit() {
    super.onInit();
    scholarship = <Scholarship>[].obs;
  }

  Future<http.Response> getAllScholarships() async {
    var response = await http
        .get(Uri.parse('$url/Scholarship/getAllScholarshipRegistrations'));

    var jsonList = json.decode(response.body);
    for (var temp in jsonList) {
      Scholarship scholarship1 = Scholarship(
        temp['id'].toString(),
        temp['cgpa'].toString(),
        temp['department'].toString(),
        temp['document'].toString(),
        temp['guardian'].toString(),
        temp['guardian_contact'].toString(),
        temp['semester'].toString(),
      );

      scholarship.add(scholarship1);
    }
    print("${response.statusCode}");
    return response;
  }
}

class StudentBinding2 implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScholarshipController>(() => ScholarshipController());
  }
}
