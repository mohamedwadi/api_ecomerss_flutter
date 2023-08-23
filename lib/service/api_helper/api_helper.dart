import 'dart:convert';

import 'package:api_ecomerss_flutter/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiHelper {


  // get data jason from the api by Url and category
  Future<List<ProdactModel>> get({required String uri, String? category}) async {
    http.Response response;
    if (category == null) {
      // get api request by url without category
      response = await http.get(Uri.parse(uri));
    } else {
      // get api request by url and add  category
      response = await http.get(Uri.parse('$uri/category/$category'));
    }
    if (response.statusCode == 200) {

      // convert the response to the list or map
      List<dynamic> data = jsonDecode(response.body);
      List<ProdactModel> list_prodact = [];
      for (int i = 0; i < data.length; i++) {

        // convert jason data to object and add the object to the list
        list_prodact.add(ProdactModel.fromJeson(data[i]));
      }
       // print('sucses request get  : ${list_prodact[0].title}');
      return list_prodact;
    } else {
      throw Exception("the state code is ${response.statusCode}");
    }
  }

    // add data to the api
    // take the bode to add product
  Future<dynamic> post({
    required String uri,
    required dynamic title,
    required dynamic id,
    required dynamic image,
    required dynamic price,
  }) async {
    // post methods
    http.Response response = await http.post(
      Uri.parse(uri),
      body: {'title': title, 'id': id, 'category': image, 'price': price},
    );
    if (response.statusCode == 200) {
      // add data
      Map<String,dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception("the state code is ${response.statusCode}");
    }
  }
  // update data
  // take the body to update data
  Future<dynamic> put({
    required String uri,
    required dynamic title,
    required dynamic id,
    required dynamic image,
    required dynamic price,
  }) async {
    http.Response response = await http.put(
      Uri.parse('$uri/$id'),
      body: {'title': title, 'id': id, 'category': image, 'price': price},
    );
    if (response.statusCode == 200) {
      Map<String,dynamic> data = jsonDecode(response.body);
      print(" sucess the state code is ${response.statusCode}");
      return data;
    } else {
      throw Exception("the state code is ${response.statusCode}");
    }
  }


}
