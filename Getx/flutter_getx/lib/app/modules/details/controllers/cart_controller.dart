import 'package:get/get.dart';

abstract class ICartController {
  void addItem();
  void countTotal();
}

class CartController extends GetxController implements ICartController {
  var itemCount = 0.obs;
  var total = 0.obs;

  @override
  void addItem() {
    itemCount++;
  }

  @override
  void countTotal() {
    total++;
  }
}
