import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/modules/details/controllers/cart_controller.dart';
import 'package:get/get.dart';

class ItemCartWidget extends StatelessWidget {
  ItemCartWidget({super.key});

  final CartController cartTotalController = Get.find(tag: "cart-total");
  final CartController cartItemQtyController = Get.find(tag: "cart-qty");

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Nama barang"),
                SizedBox(height: 10),
                Text("Rp.10.000"),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(width: .5, color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        cartItemQtyController.itemCount.value--;
                        cartTotalController.total.value--;
                      },
                      icon: Icon(
                        Icons.remove,
                        color: Theme.of(context).dividerColor,
                      )),
                  Obx(() =>
                      Text(cartItemQtyController.itemCount.value.toString())),
                  IconButton(
                      onPressed: () {
                        cartItemQtyController.itemCount.value++;
                        cartTotalController.total.value++;
                      },
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).dividerColor,
                      )),
                ]),
          )
        ]),
      ),
    );
  }
}
