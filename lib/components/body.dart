import 'package:projecttext2/screen/detals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../model/Product.dart';
import '../provider/product_provider.dart';
import 'package:projecttext2/contants.dart';

import 'category.dart';

class Body extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    final ds = Provider.of<ProductProvider>(context);
    if (ds.list.isEmpty) {
      ds.getList();
    }
    List<ProductModel> data = ds.list;
    List<String> value = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Categories(),
        viewGrid(data),
      ],
    );
  }

  Expanded viewGrid(List<ProductModel> data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (BuildContext context, index) {
              final dt = data[index];
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.cyanAccent.shade700.withOpacity(0.5),
                          Colors.cyanAccent.withOpacity(1),
                          Colors.cyanAccent.shade100.withOpacity(0.3),
                        ]),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.4), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(kDefaultPaddin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(kDefaultPaddin),
                        //height: 180,
                        //width: 160,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.network(dt.image ?? ""),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPaddin / 4),
                      child: Text(
                        dt.title ?? "",
                        style: TextStyle(color: kTextColor),
                      ),
                    ),
                    Text(
                      "\$${dt.price.toString()}",
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    const SizedBox(
                      height: 10,
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
                                  builder: (context) => DetailsScreen(
                                        product: dt,
                                      )));
                        },
                        child: Text(
                          "Add to cart",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}

//   Column ItemCard(List<ProductModel> data, int index,BuildContext context) {
// }
