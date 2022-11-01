import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:projecttext2/model/Product.dart';
import 'package:projecttext2/provider/product_provider.dart';
import 'package:provider/provider.dart';

class StorePage extends StatefulWidget {
  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    final ds = Provider.of<ProductProvider>(context);
    if (ds.list.isEmpty) {
      ds.getList();
    }
    List<ProductModel> data = ds.list;
    // data[0].price.toDouble();
    // data.forEach(((e) => totalPrice +=  * e.price));
    return Container();
  }
}
