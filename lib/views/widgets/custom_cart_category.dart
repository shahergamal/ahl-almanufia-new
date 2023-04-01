import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketky/core/model/category_model.dart';
import 'package:marketky/views/screens/category_screen.dart';

// ignore: camel_case_types
class customcartcategory extends StatelessWidget {
  const customcartcategory({
    Key key,
    @required this.category,
    @required this.customimage,
    @required this.customtext,
    this.customcolor,
  });
  final CategoryModel category;
  final ImageProvider customimage;
  final String customtext;
  final Color customcolor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CategoryScreen(categories: category,));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              height: 70,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                color: Colors.transparent,
                image: DecorationImage(
                  image: customimage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: customcolor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
