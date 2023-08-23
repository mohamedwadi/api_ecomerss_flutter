import 'package:api_ecomerss_flutter/service/api_helper/api_helper.dart';

class UpdateProductRequest{

  Future<Map<String,dynamic>> updateProduct({
    required String uri,
    required dynamic title,
    required dynamic id,
    required dynamic image,
    required dynamic price,
  }) async{
    return await ApiHelper().put(uri: uri, title: title, id: id, image: image, price: price);

  }

}