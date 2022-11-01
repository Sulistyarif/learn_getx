import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/cart_binding.dart';
import 'package:learn_getx/controllers/cart_controller.dart';
import 'package:learn_getx/presentation/home_page.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  runApp(MyApp());
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("7ab8b595-fc3e-4613-8a9b-ad45a1dcf0ef");
  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  OneSignal.shared.setNotificationOpenedHandler((openedResult) {
    print('==body: ${openedResult.notification.additionalData.toString()}');
    openedResult.notification.additionalData!.forEach((key, value) {
      print("===Key:$key | value: $value");
    });
  });
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
