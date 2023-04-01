import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/constant/constants.dart';
import 'package:marketky/constant/dimentions.dart';
import 'package:marketky/views/screens/empty_cart_page.dart';
import 'package:marketky/views/screens/search_page.dart';
import 'package:marketky/views/widgets/custom_carousel_image.dart';
import 'package:marketky/views/widgets/custom_icon_button_widget.dart';
import 'package:marketky/views/widgets/dummy_search_widget_1.dart';
import 'package:marketky/views/widgets/item_card.dart';

class StoreHome extends StatefulWidget {
  @override
  State<StoreHome> createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  List<String> items = [
    "Home",
    "Woman",
    "Men",
    "T-shirt",
    "Shose",
  ];
  List body = [
    Wrap(
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
    Wrap(
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
    Wrap(
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
    Wrap(
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
    Wrap(
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
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        automaticallyImplyLeading: false,
        title: Text(
          'Ahl alminufiyah Store,',
          style: TextStyle(
            fontSize: Dimentions.font26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          CustomIconButtonWidget(
            onTap: () {
              Get.to(EmptyCartPage());
            },
            value: 10,
            icon: SvgPicture.asset(
              'assets/icons/Bag.svg',
              color: Colors.white,
            ),
            color: Colors.orange,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimentions.width20,
                  vertical: Dimentions.height10,
                ),
                child: DummySearchWidget1(
                  customtext: 'Search...',
                  onTap: () {
                    Get.to(SearchPage());
                  },
                ),
              ),
              // CarouselSlider
              Padding(
                padding: EdgeInsets.only(
                  top: Dimentions.height10,
                ),
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
                      height: Dimentions.height45 * 4,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 21 / 6,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 900),
                      viewportFraction: 0.8,
                      animateToClosest: true,
                      clipBehavior: Clip.none,
                      disableCenter: false,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Dimentions.height10,
                  bottom: Dimentions.height10 / 2,
                  left: Dimentions.width10,
                ),
                child: Row(
                  children: [
                    Text(
                      'All Categories',
                      style: TextStyle(
                        fontSize: Dimentions.font16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              //tab bar for category
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: Dimentions.height10 / 2,
                  bottom: Dimentions.height10 / 2,
                  left: Dimentions.width10,
                  right: Dimentions.width10,
                ),
                child: Column(
                  children: [
                    //all categories
                    SizedBox(
                      height: Dimentions.height30 * 2.5,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: items.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  margin: EdgeInsets.only(
                                    top: Dimentions.height10 / 2,
                                    bottom: Dimentions.height10 / 2,
                                    left: Dimentions.width10 / 2,
                                    right: Dimentions.width10 / 2,
                                  ),
                                  width: Dimentions.width45 * 3,
                                  height: Dimentions.height45,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: current == index
                                        ? BorderRadius.circular(
                                            Dimentions.radius30 * 2)
                                        : BorderRadius.circular(
                                            Dimentions.radius15 / 2),
                                    color: current == index
                                        ? AppColor.primary
                                        : Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      items[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: current == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: Dimentions.font16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: current == index,
                                child: Container(
                                  width: Dimentions.width10 / 2,
                                  height: Dimentions.height10 / 2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.primary,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Dimentions.height10,
                        bottom: Dimentions.height10 / 2,
                        left: Dimentions.width10 / 15,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'All Products',
                            style: TextStyle(
                              fontSize: Dimentions.font16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //main
                    Container(
                      width: double.infinity,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                        child: body[current],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
