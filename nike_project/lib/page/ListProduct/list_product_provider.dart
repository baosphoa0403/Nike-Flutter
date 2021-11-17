import 'package:flutter/material.dart';
import 'package:nike_project/model/cart/cart.dart';
import 'package:nike_project/model/product/product.dart';

class ListProductProvider with ChangeNotifier {
  List<Product> listProduct = [
    Product(id: 1, name: "bao", price: 2000, description: "abc"),
    Product(id: 2, name: "sang", price: 3000, description: "cdf"),
    Product(id: 3, name: "hieu", price: 4000, description: "deg"),
  ];
}

class ListCartProvider with ChangeNotifier {
  List<Cart> listCart = [];
  void addToCart(Product product) {
    final index =
        listCart.indexWhere((element) => element.product.id == product.id);
    if (index >= 0) {
      listCart[index].quantity += 1;
    } else {
      Cart item = Cart(product: product, quantity: 1);
      listCart.add(item);
    }
    notifyListeners();
  }

  int calSumQuantityCart() {
    return listCart.fold(0, (sum, element) => sum + element.quantity);
  }

  void increaseDecease(bool flag, Cart item) {
    final index =
        listCart.indexWhere((element) => element.product.id == item.product.id);
    if (flag) {
      // +
      listCart[index].quantity += 1;
    } else {
      //-
      if (listCart[index].quantity >= 0) {
        listCart[index].quantity -= 1;
      } else {
        listCart.remove(listCart[index]);
      }
    }
    notifyListeners();
  }

  int calSumMoney() {
    return listCart.fold(
        0,
        (sum, element) =>
            sum +
            (element.quantity.toDouble() * element.product.price).toInt());
  }
}
