import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/constant/dimentions.dart';
import 'package:marketky/views/screens/Store%20app/store_home.dart';
import 'package:marketky/views/screens/page_switcher.dart';

class EmptyCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColor.primary,
        elevation: 0,
        title: Text(
          'Your Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimentions.font20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: Dimentions.iconsize24,
          color: Colors.white,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Dimentions.width45 * 5,
              height: Dimentions.height45 * 5,
              margin: EdgeInsets.only(bottom: Dimentions.height30),
              child: SvgPicture.asset('assets/icons/Paper Bag.svg'),
            ),
            Text(
              'Empty Cart  ☹️',
              style: TextStyle(
                color: AppColor.secondary,
                fontSize: Dimentions.font26,
                fontWeight: FontWeight.w700,
                fontFamily: 'poppins',
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: Dimentions.height45 * 4,
                  top: Dimentions.height12 / 10),
              child: Text(
                'Go to home and explore our interesting \nproducts and add to cart',
                style: TextStyle(
                  color: AppColor.secondary.withOpacity(0.8),
                  fontSize: Dimentions.font20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(StoreHome());
              },
              child: Text(
                'Start Shopping',
                style: TextStyle(
                  fontSize: Dimentions.font20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.secondary,
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimentions.width30,
                  vertical: Dimentions.height15,
                ),
                backgroundColor: AppColor.border,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimentions.radius15),
                ),
                shadowColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
