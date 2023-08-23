import 'package:api_ecomerss_flutter/custom_wedjet/custom_text.dart';
import 'package:api_ecomerss_flutter/model/product_model.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key , required this.product}) : super(key: key);

  final ProdactModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        children: [
      Container(
        child: Card(
          elevation: 0,
          child: Container(
              width: 220,
              height: 140,
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    text: '${product.title.toString().substring(0 , 5)}',
                    size: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: r'$'+'${product.price}',
                        size: 16,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  ),
                ],
              )),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              //<-- SEE HERE
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 10.0,
            ),
          ],
        ),
      ),
      Positioned(
        top: -40,
        left: 80,
        child: Image.network(
          product.image,
          height: 100,
          width: 100,
        ),
      )
    ]);
  }
}
