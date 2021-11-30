import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nike_project/repositories/product_detail/product_detail.impl.dart';

class DetailProductProvider with ChangeNotifier {
  void viewDetail() {
    ProductDetailImpl()
        .getProduct("6111086162979088d8f0622c")
        .then((value) async {
      const storage = FlutterSecureStorage();
      // await storage.write(key: 'product', value: value.from);
    });
  }
}
