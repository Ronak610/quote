
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quota_01/Screen/View/Add_Quote.dart';
import 'package:quota_01/Screen/View/Show_data.dart';
import 'package:quota_01/Screen/View/show_Screen.dart';

import 'Screen/View/Home_Page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home_Page(),
        'show':(context)=>Show_Screen(),
        'add':(context)=>Add_Quote(),
        'data':(context)=>Data_Show(),
      },
    ),
  );
}
