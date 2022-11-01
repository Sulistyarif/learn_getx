import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controllers/cart_controller.dart';
import 'package:learn_getx/presentation/add_item_page.dart';
import 'package:learn_getx/presentation/subscribed_page.dart';

class HomePage extends GetView<CartController> {
  HomePage({super.key});
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart Shopping'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Text(
                    'Customer Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Obx(
                      () => Text(controller.customerName.value),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Amount of items',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Obx(
                      () => Text(controller.cartItemList.length.toString()),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(controller.cartItemList[index].name!);
                    },
                    itemCount: controller.cartItemList.length,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(AddItemPage());
                },
                child: const Text('Add Item'),
              ),
            ],
          ),
        ));
  }
}
