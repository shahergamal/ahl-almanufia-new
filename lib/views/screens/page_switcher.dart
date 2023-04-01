import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/constant/dimentions.dart';
import 'package:marketky/views/screens/Store%20app/store_home.dart';
import 'package:marketky/views/screens/feeds_page.dart';
import 'package:marketky/views/screens/home_page.dart';
import 'package:marketky/views/screens/notification_page.dart';
import 'package:marketky/views/screens/profile_page.dart';

class PageSwitcher extends StatefulWidget {
  @override
  _PageSwitcherState createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomePage(),
        FeedsPage(),
        StoreHome(),
        NotificationPage(),
        ProfilePage(),
      ][_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColor.primary,
              width: Dimentions.width15 / 6,
            ),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: AppColor.primary.withOpacity(0.5),
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: Dimentions.font16,
              ),
            ),
          ),
          child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            height: Dimentions.height30 * 2.5,
            backgroundColor: Colors.white,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            destinations: [
              (_selectedIndex == 0)
                  ? NavigationDestination(
                      icon: SvgPicture.asset('assets/icons/Home-active.svg'),
                      label: 'Home')
                  : NavigationDestination(
                      icon: SvgPicture.asset('assets/icons/Home.svg'),
                      label: 'Home'),
              (_selectedIndex == 1)
                  ? NavigationDestination(
                      icon:
                          SvgPicture.asset('assets/icons/Category-active.svg'),
                      label: 'Category')
                  : NavigationDestination(
                      icon: SvgPicture.asset('assets/icons/Category.svg'),
                      label: 'Category'),
              (_selectedIndex == 2)
                  ? NavigationDestination(
                      icon: Icon(
                        Icons.store_rounded,
                        color: Colors.black,
                        size: Dimentions.iconsize16 * 2,
                      ),
                      label: 'Store')
                  : NavigationDestination(
                      icon: Icon(
                        Icons.storefront_outlined,
                        color: Colors.black.withOpacity(0.8),
                        size: Dimentions.iconsize16 * 2,
                      ),
                      label: 'Store'),
              (_selectedIndex == 3)
                  ? NavigationDestination(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.black,
                        size: Dimentions.iconsize16 * 2,
                      ),
                      label: 'Wishlist')
                  : NavigationDestination(
                      icon: Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                        size: Dimentions.iconsize16 * 2,
                      ),
                      label: 'Wishlist',
                    ),
              (_selectedIndex == 4)
                  ? NavigationDestination(
                      icon: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: AppColor.primary,
                            )),
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/categoryimg/315816383_1694904404296838_1303252134949829974_n.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      label: 'Profile')
                  : NavigationDestination(
                      icon: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: AppColor.primary,
                            )),
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/categoryimg/315816383_1694904404296838_1303252134949829974_n.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
