import 'dart:js';

import 'package:projecttext2/Screen/ProductList_Page.dart';
import 'package:projecttext2/components/body.dart';
import 'package:projecttext2/components/storepage.dart';
import 'package:projecttext2/contants.dart';
import 'package:projecttext2/Screen/cart_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.cyanAccent.shade700,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => StorePage())),
          icon: const Icon(Icons.store),
          // onPressed: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => StorePage(
          //       product: e,
          //     )),
          //   );
          // },
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListPage()),
            );
          },
          icon: const Icon(Icons.grid_on),
          //color: Colors.grey,
        ),
      ],
    );
  }
}
