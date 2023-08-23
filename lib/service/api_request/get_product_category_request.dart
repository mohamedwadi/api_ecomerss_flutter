import 'package:api_ecomerss_flutter/model/product_model.dart';
import 'package:api_ecomerss_flutter/service/api_helper/api_helper.dart';

class GetProductCategoryRequest {
  Future<List<ProdactModel>> getProductCatogry({
    required String uri,
    required String category,
  }) async {
    List<ProdactModel> list_product =
        await ApiHelper().get(uri: uri, category: category);
    return list_product;
  }
}
