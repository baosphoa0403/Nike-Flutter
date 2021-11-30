import 'package:nike_project/model/entity/product_item/product_item.dart';
import 'package:nike_project/model/response/product_item_response.dart';

abstract class ProductIteamRepository {
  Future<List<ProductItem>> getListProduct();
}
