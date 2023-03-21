import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/constants.dart';
import 'package:marketky/core/model/Category.dart';
import 'package:marketky/core/services/CategoryService.dart';
import 'package:marketky/views/screens/empty_cart_page.dart';
import 'package:marketky/views/screens/message_page.dart';
import 'package:marketky/views/screens/search_page.dart';
import 'package:marketky/views/widgets/custom_carousel_image.dart';
import 'package:marketky/views/widgets/custom_cart_category.dart';
import 'package:marketky/views/widgets/custom_icon_button_widget.dart';
import 'package:marketky/views/widgets/dummy_search_widget_1.dart';
import 'package:marketky/views/widgets/item_card.dart';

import '../../core/model/product_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categoryData = CategoryService.categoryData;
  //List<ProductModel>productData = ProductService.productData;

  Timer flashsaleCountdownTimer;
  Duration flashsaleCountdownDuration = Duration(
    hours: 24 - DateTime.now().hour,
    minutes: 60 - DateTime.now().minute,
    seconds: 60 - DateTime.now().second,
  );

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (_) {
      setCountdown();
    });
  }

  void setCountdown() {
    if (this.mounted) {
      setState(() {
        final seconds = flashsaleCountdownDuration.inSeconds - 1;

        if (seconds < 1) {
          flashsaleCountdownTimer.cancel();
        } else {
          flashsaleCountdownDuration = Duration(seconds: seconds);
        }
      });
    }
  }

  @override
  void dispose() {
    if (flashsaleCountdownTimer != null) {
      flashsaleCountdownTimer.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String seconds = flashsaleCountdownDuration.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    String minutes = flashsaleCountdownDuration.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    String hours = flashsaleCountdownDuration.inHours
        .remainder(24)
        .toString()
        .padLeft(2, '0');

    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/categoryimg/b_g_app.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            // Section 1
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 26),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Row(
                          children: [
                            //shoping chart
                            CustomIconButtonWidget(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EmptyCartPage()));
                              },
                              value: 5,
                              icon: SvgPicture.asset(
                                'assets/icons/Bag.svg',
                                color: Colors.white,
                              ),
                            ),
                            //mesage
                            /* CustomIconButtonWidget(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MessagePage()));
                              },
                              value: 4,
                              margin: EdgeInsets.only(left: 16),
                              icon: SvgPicture.asset(
                                'assets/icons/Chat.svg',
                                color: Colors.white,
                              ),
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  ),
                  //search bar
                  DummySearchWidget1(
                    customtext: 'Find Products & Services...',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // CarouselSlider
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
                  height: 180,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 20 / 6,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 900),
                  viewportFraction: 0.8,
                  animateToClosest: true,
                  clipBehavior: Clip.none,
                ),
              ),
            ),
            // Section 2 - category
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //main header of category
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'All Category',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  // Category list
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    height: 90,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return customcartcategory(
                          onPressed: () {},
                          customimage:
                              AssetImage('assets/categoryimg/shop_logo.jpeg'),
                          customtext: categories[index].name,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Section 4 - Flash Sale
            /* Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Flash Sale',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: FlashsaleCountdownTile(
                                digit: hours[0],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: FlashsaleCountdownTile(
                                digit: hours[1],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: Text(
                                ':',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: FlashsaleCountdownTile(
                                digit: minutes[0],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: FlashsaleCountdownTile(
                                digit: minutes[1],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: Text(
                                ':',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: FlashsaleCountdownTile(
                                digit: seconds[0],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: FlashsaleCountdownTile(
                                digit: seconds[1],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 310,
                          child: ListView(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              productData.length,
                              (index) {
                                return Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ItemCard(
                                      product: productData[index],
                                      titleColor: AppColor.primarySoft,
                                      priceColor: AppColor.accent,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: LinearProgressIndicator(
                                                  minHeight: 10,
                                                  value: 0.4,
                                                  color: AppColor.accent,
                                                  backgroundColor:
                                                      AppColor.border,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.local_fire_department,
                                            color: AppColor.accent,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //       child: Container(
                                    //         color: Colors.amber,
                                    //         height: 10,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),*/
            // Section 5 - product list
            Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                'Todays recommendation',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 7),
              height: 350,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ItemCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
