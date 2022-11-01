import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controllers/cart_controller.dart';
import 'package:learn_getx/models/item.dart';

class AddItemPage extends GetView<CartController> {
  AddItemPage({super.key});
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Page'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text(
                'Item name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: TextField(
                  controller: cartController.itemNameController,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Item amount',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: TextField(
                  controller: cartController.itemAmountController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              cartController.addItemToCart(
                Item(
                  name: cartController.itemNameController.text,
                  amount: int.parse(cartController.itemAmountController.text),
                ),
              );
              Get.back();
            },
            child: const Text('Add Item'),
          ),
        ],
      ),
    );
  }
}
