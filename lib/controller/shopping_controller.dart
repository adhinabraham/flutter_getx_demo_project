import 'package:get/get.dart';

import '../model/product.dart';

class ShoppingController extends GetxController {

  var products = List<Product>.empty(growable: true).obs;

  @override
  void onInit(){
    super.onInit();
    fetchProudcts();
  }

  void fetchProudcts() async{
    print("some is working here ---------------------->");
    await Future.delayed(Duration(seconds: 3));
    var productsResults = [Product(id: 0, price: 100, productImage: 'Tshrit', productName: 'Tshirt', proudctDescription: 'mensTshirt'),
      Product(id: 1, price: 200, productImage: 'Tshrit', productName: 'Tshirt', proudctDescription: 'womens tshirt'),
      Product(id: 2, price: 300, productImage: 'Tshrit', productName: 'Tshirt', proudctDescription: 'mens tshirt '),
      Product(id: 3, price: 400, productImage: 'Tshrit', productName: 'Tshirt', proudctDescription: 'womens t shrit '),
    ];
    products.value= productsResults;
  }

}