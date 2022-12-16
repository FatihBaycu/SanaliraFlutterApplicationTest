import 'package:sanalira_flutter_application_test/models/response.dart';
import 'bank.dart';

class Result {
  MyResponse? response;
  List<Bank>? banks;


  Result({this.response, this.banks});

 Result.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new MyResponse.fromJson(json['response'])
        : null;
    if (json['data'] != null) {
      banks = <Bank>[];
      json['data'].forEach((v) {
        banks!.add(new Bank.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    if (this.banks != null) {
      data['data'] = this.banks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}