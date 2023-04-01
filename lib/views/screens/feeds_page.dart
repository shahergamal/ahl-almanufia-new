import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/ExploreItem.dart';
import 'package:marketky/core/model/ExploreUpdate.dart';
import 'package:marketky/core/services/ExploreService.dart';
import 'package:marketky/views/widgets/custom_categorycard_Feed.dart';
import 'package:marketky/views/widgets/main_app_bar_widget.dart';

import '../../constant/constants.dart';
import '../widgets/item_card.dart';

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> with TickerProviderStateMixin {
  TabController tabController;
  List<ExploreItem> listExploreItem = ExploreService.listExploreItem;
  List<ExploreUpdate> listExploreUpdateItem =
      ExploreService.listExploreUpdateItem;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        cartValue: 2,
        chatValue: 2,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          // Tabbbar
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: AppColor.primary,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  tabController.index = index;
                });
              },
              controller: tabController,
              indicatorColor: AppColor.accent,
              indicatorWeight: 5,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'poppins',
                  fontSize: 16),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w400, fontFamily: 'poppins'),
              tabs: [
                Tab(
                  text: 'All Services',
                ),
                Tab(
                  text: 'All Products',
                ),
              ],
            ),
          ),
          // Section 2 - Tab View
          IndexedStack(
            index: tabController.index,
            children: [
              // Tab 1 - category
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(
                    categories.length,
                    (index) {
                      return CustomcategorycardFeed(
                        category: categories[index],
                        customimage:
                            AssetImage('assets/categoryimg/مستشفيات2022.jpg'),
                        customtext: categories[index].name,
                      );
                    },
                  ),
                ),
              ),
              // Tab 2 - product
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
        ],
      ),
    );
  }
}
