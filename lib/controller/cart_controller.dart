import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_tutorial1/model/product.dart';

class CartController extends GetxController {
  var cartItems = List<Product>.empty(growable: true).obs;
  int get cartItemCount => cartItems.length;
  double get totalItem => cartItems.fold(0.0, (previousValue, element) => previousValue+ element.price);
  
  void cartTotalitems (Product item){
    cartItems.add(item);
  }

  void cartItemReomve (Product item){
    cartItems.remove(item);
  }
  
}