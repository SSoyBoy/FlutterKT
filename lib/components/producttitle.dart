import 'package:projecttext2/contants.dart';
import 'package:projecttext2/model/Product.dart';
import 'package:flutter/material.dart';

class ProductTitleWidthImage extends StatelessWidget {
  const ProductTitleWidthImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Text(
              product.title ?? "",
              style: TextStyle(
                color: kTextLightColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text: "Price\n",
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  TextSpan(
                      text: "\$${product.price}",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                ],
              )),
              SizedBox(width: 100),
              Expanded(
                child: Image.network(
                  product.image ?? "",
                  width: 50,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
