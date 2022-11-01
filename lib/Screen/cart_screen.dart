import 'package:projecttext2/contants.dart';
import 'package:projecttext2/model/Product.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatelessWidget {
  final ProductModel product;
  const CartScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> ds = [];
    if (ds.isEmpty) {
      ds.add(product);
    } else {
      ds.forEach((element) {
        if (product.title != element.title) {
          ds.add(product);
        }
      });
    }
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: kTextLightColor,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: SvgPicture.asset(
      //       "assets/icons/back.svg",
      //       color: Colors.white,
      //     ),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: SvgPicture.asset(
      //         "assets/icons/search.svg",
      //         color: Colors.white,
      //       ),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //       icon: SvgPicture.asset(
      //         "assets/icons/store.svg",
      //         color: Colors.white,
      //       ),
      //       onPressed: () {},
      //     ),
      //     const SizedBox(width: kDefaultPaddin / 2)
      //   ],
      // ),
      body: ListView.builder(
        itemCount: ds.length,
        itemBuilder: (BuildContext context, index) {
          final dt = ds[index];
          return Container(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    dt.image ?? "",
                    height: 56,
                    width: 56,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 16, bottom: 32, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //pp.list[index].title ?? "",
                          //show[index].title ?? "",
                          dt.title ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          //pp.list[index].price.toString() ?? "",
                          dt.price.toString() ?? "",
                          style:
                              const TextStyle(fontSize: 20, color: Colors.red),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
