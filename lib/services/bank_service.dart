  import 'package:sanalira_flutter_application_test/core/services/http_generic_service.dart';

class BankService{

    var httpGenericService=HttpGenericService();

  Future getBankList()async{
    return await httpGenericService.genericHttGet("https://api.sanalira.com/assignment");
 
    }

  }
