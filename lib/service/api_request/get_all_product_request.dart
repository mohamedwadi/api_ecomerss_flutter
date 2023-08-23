import 'package:api_ecomerss_flutter/model/product_model.dart';
import 'package:api_ecomerss_flutter/service/api_helper/api_helper.dart';

class GetAllProductRequest{

  Future<List<ProdactModel>> getAllProduct({required String uri}) async{
    List<ProdactModel> list_product = await ApiHelper().get(uri: uri);
    // for(int i = 0; i<list_product.length; i++){
    //   print('name is ${list_product[i].title}');
    //   print('name is ${list_product[i].id}');
    //
    // }
    return list_product;
  }

}