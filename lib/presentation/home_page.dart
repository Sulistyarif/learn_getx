import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learn_getx/controllers/cart_controller.dart';
import 'package:learn_getx/presentation/add_item_page.dart';

class HomePage extends GetView<CartController> {
  HomePage({super.key});
  final cartController = Get.find<CartController>();
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart Shopping'),
          actions: [
            GestureDetector(
              onTap: () {
                onEditName();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.edit_outlined),
              ),
            ),
          ],
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
                      return Row(
                        children: [
                          Text(
                            controller.cartItemList[index].amount!.toString(),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(controller.cartItemList[index].name!),
                            ),
                          ),
                        ],
                      );
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

  void onEditName() {
    Get.defaultDialog(
      title: 'Change customer name',
      content: Column(
        children: [
          TextField(
            controller: cartController.customerNameController,
          ),
          ElevatedButton(
            onPressed: () {
              cartController.updateCustomerName(
                  cartController.customerNameController.text);
              Get.back();
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
