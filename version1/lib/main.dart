import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:version1/screens/HomeScreen/MainScreen.dart';
import 'package:version1/screens/ProceedPayment.dart';
import 'package:version1/screens/ReceiversDetails.dart';
import 'package:version1/screens/Search_page.dart';
import 'package:version1/screens/login_otp_page.dart';
import 'package:version1/screens/select_goods.dart';
import 'package:version1/screens/select_vehicle.dart';
import 'package:version1/screens/splash_scree.dart';
import 'package:version1/screens/starting_screen.dart';
import 'package:version1/screens/verify_otp_page.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'onev',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MainScreen(),
    );
  }
}
