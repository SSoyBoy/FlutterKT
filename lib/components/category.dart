import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projecttext2/contants.dart';
import '../provider/product_provider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    List<String> caregories = pp.list.map(
      (e) {
        return e.category ?? "";
      },
    ).toList();
    List<String> ca = [];
    caregories.forEach((element) {
      if (ca.contains(element) == false) {
        ca.add(element);
      }
    });
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ca.length,
          itemBuilder: (context, index) =>
              buildCategory(ca, index, selectedIndex),
        ),
      ),
    );
  }

  Widget buildCategory(List<String> ca, int index, int selectedIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 0),
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
                ca[index],
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: kDefaultPaddin / 4),
            //   height: 2,
            //   width: 30,
            //   color: selectedIndex == index ? Colors.black : Colors.transparent,
            // )
          ],
        ),
      ),
    );
  }
}
