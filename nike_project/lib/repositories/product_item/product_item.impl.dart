import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nike_project/model/entity/product_item/product_item.dart';
import 'package:nike_project/model/response/product_item_response.dart';
import 'package:nike_project/repositories/product_item/product_item.abstract.dart';
import 'package:nike_project/toast/toast.dart';

class ProductItemImpl extends ProductIteamRepository {
  @override
  Future<List<ProductItem>> getListProduct() async {
    List<ProductItem>? result;
    try {
      Response res = await Dio()
          .get("http://management-shoes.herokuapp.com/product/filter");
      //print(res.data);
      List<dynamic> data = jsonDecode(jsonEncode(res.data));
      //print(jsonDecode("[" + res.data + "]"));
      result = data
          .map(
            (dynamic item) => ProductItem.fromJson(item),
          )
          .toList();

      // print(result.toString());
    } on DioError catch (e) {
      print("baonguuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
      print(e);
      showToastFail(e.response?.data["message"]);
    }
    return result!;
  }
}
