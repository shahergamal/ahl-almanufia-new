import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketky/constant/constants.dart';
import 'package:marketky/core/model/category_model.dart';
import 'package:marketky/views/screens/search_page.dart';
import 'package:marketky/views/widgets/custom_app_bar.dart';
import 'package:marketky/views/widgets/custom_carousel_image.dart';
import 'package:marketky/views/widgets/item_card.dart';

import '../widgets/custom_text.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryModel categories;
  CategoryScreen({
    @required this.categories,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    CategoryModel categories = widget.categories;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 275,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                //app bar
                CustomAppBar(
                  title: categories.name,
                  leftIcon: Icon(Icons.arrow_back_ios),
                  leftOnTap: () {
                    Get.back();
                  },
                  rightIcon:Icon(Icons.search) ,
                  rightOnTap: (){
                    Get.to(SearchPage());
                  },
                ),
                //CarouselSlider
                Container(
                  child: CarouselSlider(
                    items: [
                      CustomCarouselImage(
                        customimage: AssetImage(
                            'assets/categoryimg/We scale DTC brands 🚀.jpeg'),
                      ),
                      CustomCarouselImage(
                        customimage: AssetImage(
                            'assets/categoryimg/Premium PSD _ Fitness training and gym workout facebook timeline cover or social media web banner template.jpeg'),
                      ),
                      CustomCarouselImage(
                        customimage: AssetImage(
                            'assets/categoryimg/Premium PSD _ Sideways man listening to music banner web template.jpeg'),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 200,
                      padEnds: true,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 20 / 6,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 900),
                      viewportFraction: 1.03,
                      animateToClosest: true,
                      clipBehavior: Clip.none,
                      disableCenter: true,

                    ),
                  ),
                ),
              ],
            ),
          ),
          // text
          Padding(
            padding: const EdgeInsets.all(15),
            child: MyText(
              customText: 'All Products',
              customsize: 14,
              customcolor: Colors.black.withOpacity(0.5),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(
                products.length,
                (index) => ItemCard(
                  product: products[index],
                  titleColor: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
