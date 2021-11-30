import 'package:nike_project/model/entity/details_product/details_product.dart';
import 'package:nike_project/model/response/product_detail_response.dart';

abstract class ProductDetailRepository {
  Future<List<ProductDetailResponse>> getProduct(String id);
}
