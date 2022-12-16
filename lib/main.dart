import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:sanalira_flutter_application_test/controller/bank_controller.dart';
import 'package:sanalira_flutter_application_test/extensions/hive/user_hive.dart';
import 'package:sanalira_flutter_application_test/screens/bank_list_screen.dart';
import 'package:sanalira_flutter_application_test/screens/register_screen.dart';


class MyHttpOverrides extends HttpOverrides {

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async{
  HttpOverrides.global =  MyHttpOverrides();
  await myHives();

SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>BankController()),
    ],    
    child:const MyApp())
    );
}

myHives()async{
  await Hive.initFlutter();
  await Hive.openBox("user");
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => const BankListScreen(),
        "register":(context) => const RegisterScreen()
      },
      initialRoute: UserHive.getUser().email!=null?"/":"register",
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}