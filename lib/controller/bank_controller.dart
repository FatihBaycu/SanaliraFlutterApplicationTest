import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:sanalira_flutter_application_test/services/bank_service.dart';

import '../models/bank.dart';

class BankController extends ChangeNotifier{

  var banks=<Bank>[];

  List<Bank> get getBanks=>banks;

  var bankService=BankService();

getBankList() async {
      await bankService.getBankList().then((response) {
        var result = (jsonDecode(response.body)["data"] as List)
            .map((e) => Bank.fromJson(e))
            .toList();
        banks = result;
        });
    notifyListeners();
  }
}
