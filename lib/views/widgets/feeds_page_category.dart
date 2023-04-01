import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/constant/dimentions.dart';
import 'package:marketky/views/screens/category_screen.dart';

import '../../core/model/category_model.dart';

class FeedsPageCategory extends StatelessWidget {
  const FeedsPageCategory({
    Key key,
    @required this.customtitle,
    @required this.category,
  }) : super(key: key);
  final String customtitle;
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return CategoryScreen(categories: category);
        })));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/categoryimg/سوق2022.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                bottom: -20,
                child: Container(
                  width: 150,
                  height:50,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category.name,
                        style: TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
