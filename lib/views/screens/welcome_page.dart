import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/api_constants.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/constant/constants.dart';
import 'package:marketky/core/model/category_model.dart';
import 'package:marketky/core/model/product_model.dart';
import 'package:marketky/views/screens/login_page.dart';
import 'package:http/http.dart' as http;

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Section 1 - Illustration
            Container(
              margin: EdgeInsets.only(top: 32),
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset('assets/icons/shopping illustration.svg'),
            ),
            // Section 2 - Marketky with Caption
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Ahl almanufia',
                    style: TextStyle(
                      color: AppColor.secondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
                Text(
                  'Enjoy the best shopping experience with Ahl,\n you will find all services and products in one place.',
                  style: TextStyle(
                    color: AppColor.secondary.withOpacity(0.7),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            // Section 3 - Get Started Button
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getCategories() async {
    // print('getcategories started');
    var response = await http
        .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.getCategories));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var map in data) {
        var cat = CategoryModel.fromjson(map);
        categories.add(cat);
      }
    }
  }

  getProducts() async {
    print('getproductes started');
    var response = await http
        .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.getProducts));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print('done');
      print(data.length);
      for (var map in data) {
        var product = ProductModel.fromjson(map);
        products.add(product);
      }
    }
  }

  @override
  void initState() {
    getCategories();
    getProducts();
    super.initState();
  }
}
