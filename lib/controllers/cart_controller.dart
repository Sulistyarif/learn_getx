import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learn_getx/models/item.dart';

class CartController extends GetxController {
  final storage = GetStorage();

  final customerName = 'Joko'.obs;
  final cartItemList = <Item>[].obs;
  final isDoneShopping = false.obs;

  final customerNameController = TextEditingController();
  final itemNameController = TextEditingController();
  final itemAmountController = TextEditingController();

  updateCustomerName(String name) {
    storage.write('customerName', name);
    customerName(name);
  }

  addItemToCart(Item item) {
    cartItemList.add(item);
    // print(jsonEncode(cartItemList));
  }

  changeStateShopping(bool isDone) {
    isDoneShopping(isDone);
  }
}
