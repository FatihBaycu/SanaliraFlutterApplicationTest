import 'package:sanalira_flutter_application_test/constants/bank_list_constant.dart';

String getBankImage(String bankName) {
  for (int i = 0; i < BankListConstant.bankImage.length; i++) {
    if (BankListConstant.bankImage[i].bankName!.contains(bankName)) {
      return BankListConstant.bankImage[i].bankImage.toString();
    }
  }
  return BankListConstant.banner;
}
