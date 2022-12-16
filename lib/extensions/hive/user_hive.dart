import 'package:hive/hive.dart';

import '../../models/user.dart';

class UserHive{

    static setUser(User user)  {
    var userBox = Hive.box('user');
    userBox.put('firstName', user.firstName);
    userBox.put('lastName', user.lastName);
    userBox.put('email', user.email);
    userBox.put('phoneNumber', user.phoneNumber);
  }

  static User getUser() {
    var userBox = Hive.box('user');
       var user=User();
      user.firstName=userBox.get("firstName");
      user.lastName=userBox.get("lastName");
      user.email=userBox.get("email");
      user.phoneNumber=userBox.get("phoneNumber");
      //print(user.firstName);

    if(user.email==null) {
      return User();
    } else {
      return user;
    }
  }
}