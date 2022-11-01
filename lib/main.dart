import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/cart_binding.dart';
import 'package:learn_getx/controllers/cart_controller.dart';
import 'package:learn_getx/presentation/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Learn',
      home: HomePage(),
      initialBinding: CartBinding(),
    );
  }
}
