import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/models/item.dart';

class CartController extends GetxController {
  final customerName = 'Joko'.obs;
  final cartItemList = <Item>[].obs;
  final isDoneShopping = false.obs;

  final customerNameController = TextEditingController();
  final itemNameController = TextEditingController();
  final itemAmountController = TextEditingController();

  updateCustomerName(String name) {
    customerName(name);
  }

  addItemToCart(Item item) {
    cartItemList.add(item);
  }

  changeStateShopping(bool isDone) {
    isDoneShopping(isDone);
  }
}
