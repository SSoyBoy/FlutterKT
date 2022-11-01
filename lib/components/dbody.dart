import 'dart:html';

import 'package:projecttext2/components/producttitle.dart';
import 'package:projecttext2/contants.dart';
import 'package:projecttext2/model/Product.dart';
import 'package:projecttext2/Screen/cart_screen.dart';
import 'package:flutter/material.dart';

class dBody extends StatelessWidget {
  final ProductModel product;
  dBody({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String totalprice = product.price.toString();
    var total = double.parse(totalprice);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.5),
                  height: 400,
                  decoration: const BoxDecoration(
                      color: Colors.cyanAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                        child: Text(
                          product.description ?? "",
                          style: TextStyle(
                              height: 1.5, color: kTextColor, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CartCounter(),
                      // Padding(
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                      //   child: Text(
                      //     total.toString(),
                      //     style: TextStyle(
                      //         height: 1.5, color: kTextColor, fontSize: 18),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen(
                                          product: product,
                                        )));
                          },
                          child: Text("Add to cart",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white))),
                    ],
                  ),
                ),
                ProductTitleWidthImage(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  get total => total;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
        // SizedBox(
        //   width: 30,
        //   height: 32,
        OutlinedButton(
          // padding: EdgeInsets.zero,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(13),
          //),
          onPressed: () {
            setState(() {
              if (numOfItems > 1) numOfItems--;
            });
          },
          child: Icon(Icons.remove),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        OutlinedButton(
          // padding: EdgeInsets.zero,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(13),
          //),
          onPressed: () {
            setState(() {
              numOfItems++;
            });
          },
          child: Icon(Icons.add),
        ),

        // )
      ],
    );
  }
}
