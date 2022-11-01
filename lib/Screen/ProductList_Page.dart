import 'dart:js';

import 'package:projecttext2/Screen/cart_screen.dart';
import 'package:projecttext2/Screen/detals_screen.dart';
import 'package:projecttext2/Screen/home_screen.dart';
// import 'package:projecttext2/components/body.dart';
// import 'package:projecttext2/contants.dart';
// import 'package:projecttext2/Screen/cart_screen.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:projecttext2/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    ViewType _viewType = ViewType.grid;
    int _crossAxisCount = 2;
    double _aspectRatio = 1.5;
    if (pp.list.isEmpty) {
      pp.getList();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyanAccent.shade700,
        actions: [
          IconButton(
              onPressed: () {
                // showSearch(
                //     context: context,
                //     delegate: HomeScreen()
                // );
              },
              icon: const Icon(Icons.search)),
          IconButton(
            icon: const Icon(Icons.store),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => StorePage(
              //     product: e,
              //   )),
              // );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: const Icon(Icons.view_list),
            //color: Colors.grey,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...pp.list.map((e) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 0),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.cyanAccent.withOpacity(1),
                                    Colors.cyanAccent.shade100.withOpacity(0.3),
                                  ]),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            e.category ?? "",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList()
                    ],
                  ),
                ),
                // ElevatedButton(
                //     style:
                //
                //     ElevatedButton.styleFrom(
                //       backgroundColor: Colors.blueGrey,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20), // <-- Radius
                //       ),
                //       padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                //     ),
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => ProductGridPage()),
                //       );
                //
                //     },
                //     child: Text("Gridview")
                // ),

                const SizedBox(
                  height: 20,
                ),
                ...pp.list.map((e) {
                  return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                          left: 5, right: 5, bottom: 10, top: 0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.cyanAccent.withOpacity(1),
                                Colors.cyanAccent.shade100.withOpacity(0.3),
                              ]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            e.image ?? "",
                            height: 150,
                            width: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title ?? "",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  e.description ?? "",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "\$${e.price.toString()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.amberAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // <-- Radius
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CartScreen(
                                                        product: e,
                                                      )),
                                            );
                                          },
                                          child: Text("Mua")),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.amberAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // <-- Radius
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsScreen(
                                                        product: e,
                                                      )),
                                            );
                                          },
                                          child: Text("Add to cart")),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ))
                        ],
                      ));
                }).toList()
              ],
            ),
          ),
        ),
      ),
      // body: ListView(
      //
      //   scrollDirection: Axis.vertical,
      //   children: [
      //     ...pp.list.map((e) {
      //
      //       return Image.network(e.image??"");
      //     }).toList()
      //   ]
      // )
    );
  }
}

enum ViewType { grid, list }
