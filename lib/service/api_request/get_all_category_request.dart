
import 'dart:convert';

import 'package:http/http.dart' as http;

// get all type of category from the api

class GetAllCategoryRequest{

  Future<List<dynamic>>  getAllCategory({required String uri}) async{

  http.Response response = await http.get(Uri.parse(uri));
  List<dynamic>  data = jsonDecode(response.body);
  if(response.statusCode == 200) {
      return data;
  }else{
  throw Exception("the state code is ${response.statusCode}");
  }

  }



}