import 'package:flutter/cupertino.dart';
import 'package:nike_project/model/modelProduct/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> listProduct = [
    Product(1, "SP1", "desc1", 10000),
    Product(2, "SP2", "desc2", 12000),
    Product(3, "SP3", "desc3", 9000),
    Product(4, "SP4", "desc4", 15000),
  ];
}

class CartProvider with ChangeNotifier {
  List<CartProduct> listCart = [];
  void storageCart(Product product) {
    var index = listCart.indexWhere((item) => item.product.id == product.id);
    if (index == -1) {
      CartProduct item = CartProduct(product: product, quantity: 1);
      listCart.add(item);
    } else {
      listCart[index].quantity++;
    }
    notifyListeners();
  }

  int countTotal() {
    return listCart.fold(0, (sum, element) => sum += element.quantity);
  }

  void handleChangeQuantity(bool state, CartProduct cartProduct) {
    var index = listCart
        .indexWhere((item) => item.product.id == cartProduct.product.id);
    if (state) {
      listCart[index].quantity++;
    } else {
      if (listCart[index].quantity > 0) {
        listCart[index].quantity--;
      } else {
        listCart.remove(listCart[index]);
      }
    }
    notifyListeners();
  }
}
