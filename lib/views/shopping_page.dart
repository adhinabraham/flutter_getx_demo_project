import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial1/controller/shopping_controller.dart';
import 'package:getx_tutorial1/model/product.dart';

import '../controller/cart_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({
    super.key,
  });
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: GetX<ShoppingController>(builder: (controller) {
              log("${controller.products.length}---------------------->");
              return ListView.builder (
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    Product item = controller.products[index];
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item.productName),
                                Text(item.proudctDescription)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${item.price}"),
                               TextButton(onPressed: (){
                                  cartController.cartTotalitems(item);

                                }, child: const Text("add to cart")),
                                TextButton(onPressed: (){
                                  cartController.cartItemReomve(item);

                                }, child: const Text("remove from cart"))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }),
          ),
          GetX<CartController>(builder:(controller){
            return Text("Total amount : ${controller.totalItem} : items in cart : ${controller.cartItemCount}  ");
          }),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
