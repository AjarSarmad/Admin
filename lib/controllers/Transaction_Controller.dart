import 'package:get/get.dart';
import '../models/transaction.dart';
import '/models/student.dart';
import 'dbhelper.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class TransactionController extends GetxController {
  static const String url = 'http://192.168.18.11:80/api';
  late RxList<Transaction> transactions;

  @override
  void onInit() {
    super.onInit();
    // debitTransactions = <Transaction>[].obs;
    transactions = <Transaction>[].obs;
  }

  Future<http.Response> getAllTransactions() async {
    var response =
        await http.get(Uri.parse('$url/Transactions/getAllTransactions'));

    var jsonList = json.decode(response.body);
    for (var temp in jsonList) {
      Transaction transaction = Transaction(
          temp['id'].toString(),
          temp['amount'].toString(),
          temp['senderName'].toString(),
          temp['recieverName'].toString(),
          temp['senderId'].toString(),
          temp['recieverId'].toString(),
          temp['senderAccount'].toString(),
          temp['recieverAccount'].toString(),
          temp['date'],
          temp['time'],
          temp['note'],
          temp['type']);
      transactions.add(transaction);
    }
    transactions.sort((a, b) => b.date.compareTo(a.date));

    print("${response.statusCode}");
    return response;
  }
}

class StudentBinding2 implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
