import 'package:api_ecomerss_flutter/custom_wedjet/custom_card.dart';
import 'package:api_ecomerss_flutter/custom_wedjet/custom_text.dart';
import 'package:api_ecomerss_flutter/model/product_model.dart';
import 'package:api_ecomerss_flutter/service/api_request/add_new_product_request.dart';
import 'package:api_ecomerss_flutter/service/api_request/get_all_product_request.dart';
import 'package:api_ecomerss_flutter/service/api_request/get_product_category_request.dart';
import 'package:api_ecomerss_flutter/service/api_request/update_product_request.dart';
import 'package:flutter/material.dart';

class TestApi extends StatelessWidget {
  TestApi({Key? key}) : super(key: key);

  Future<List<ProdactModel>> list_product = GetAllProductRequest()
      .getAllProduct(uri: 'https://fakestoreapi.com/products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Product',
        ),
        actions: [
          Container(
              padding: EdgeInsetsDirectional.only(end: 10),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  GetAllProductRequest()
                      .getAllProduct(uri: 'https://fakestoreapi.com/products');
                },
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 5, end: 5, top: 65),
        child: FutureBuilder<List<ProdactModel>>(
          future: GetAllProductRequest().getAllProduct(uri: 'https://fakestoreapi.com/products'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProdactModel> products = snapshot.data!;

              // print(products[1]);
              // print(products.length);

              return GridView.builder(
                clipBehavior: Clip.none,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return CustomCard(product: products[index],);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
