import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nike_project/model/response/product_detail_response.dart';
import 'package:nike_project/repositories/product_detail/product_detail.abstract.dart';
import 'package:nike_project/toast/toast.dart';

class ProductDetailImpl extends ProductDetailRepository {
  @override
  Future<List<ProductDetailResponse>> getProduct(String id) async {
    String id = "6111086162979088d8f0622c";
    List<ProductDetailResponse>? result;
    try {
      Response res = await Dio().get(
          "http://management-shoes.herokuapp.com/product/$id/productDetail");
      List<dynamic> data = jsonDecode(jsonEncode(res.data));
      result = data
          .map(
            (dynamic item) => ProductDetailResponse.fromJson(item),
          )
          .toList();
      print(result);
    } on DioError catch (e) {
      print("baonguuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
      print(e);
      showToastFail(e.response?.data["message"]);
    }
    return result!;
  }
}
