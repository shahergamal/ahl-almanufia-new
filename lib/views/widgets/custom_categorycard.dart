import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketky/core/model/category_model.dart';
import 'package:marketky/views/screens/category_screen.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({
    Key key,
    @required this.category,
    @required this.customimage,
    @required this.customtext,
    this.customcolor,
  }) : super(key: key);
  final CategoryModel category;
  final ImageProvider customimage;
  final String customtext;
  final Color customcolor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          CategoryScreen(categories: category),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          children: [
            //image category
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                image: DecorationImage(
                  image: customimage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //row(title)
            Container(
              width: 150,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xff333436),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //title
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: customcolor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
