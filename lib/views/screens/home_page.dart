import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/constant/constants.dart';
import 'package:marketky/constant/dimentions.dart';
import 'package:marketky/views/screens/search_page.dart';
import 'package:marketky/views/widgets/custom_carousel_image.dart';
import 'package:marketky/views/widgets/custom_categorycard.dart';
import 'package:marketky/views/widgets/dummy_search_widget_1.dart';
import 'package:marketky/views/widgets/item_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Section 1
          Container(
            height: 300,
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
                Container(
                  margin: EdgeInsets.only(top: 26),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Main headline
                      Text(
                        'All you want \n in one place.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          height: 150 / 100,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(
                        width: 125,
                      ),
                      //profile image
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: AppColor.primary,
                            size: Dimentions.iconsize24 + 5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.search,
                            color: AppColor.primary,
                            size: Dimentions.iconsize24 + 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //search bar

                // CarouselSlider
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
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
                        height: 180,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 21 / 6,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 900),
                        viewportFraction: 0.9,
                        animateToClosest: true,
                        clipBehavior: Clip.none,
                        disableCenter: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Section 2 - category
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.secondary.withOpacity(0.7),
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //main header of category
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Text(
                    'All Category',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                // Category list
                Container(
                  margin: EdgeInsets.only(top: 7),
                  height: 150,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CustomCategoryCard(
                        category: categories[index],
                        customimage:
                            AssetImage('assets/categoryimg/shop_logo.jpeg'),
                        customtext: categories[index].name,
                        customcolor: Colors.white,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Section 5 - product list
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text(
              'Todays recommendation',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
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
