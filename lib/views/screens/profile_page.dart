import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/views/screens/addproducts_services.dart';
import 'package:marketky/views/widgets/main_app_bar_widget.dart';
import 'package:marketky/views/widgets/menu_tile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        cartValue: 2,
        chatValue: 2,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Section 1 - Profile Picture - Username - Name
          Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/categoryimg/b_g_app.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  // Profile Picture
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/categoryimg/315816383_1694904404296838_1303252134949829974_n.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Fullname
                  Container(
                    margin: EdgeInsets.only(bottom: 4, top: 14),
                    child: Text(
                      'Shaher gamal',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  // Username
                  Text(
                    'shahergamalaboali@gmail.com',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6), fontSize: 14),
                  ),
                ],
              ),
            ),
          ]),
          // Section 2 - Account Menu
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    'ACCOUNT',
                    style: TextStyle(
                        color: AppColor.secondary.withOpacity(0.5),
                        letterSpacing: 6 / 100,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                MenuTileWidget(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return AddProductsservices();
                    })));
                  },
                  margin: EdgeInsets.only(top: 10),
                  icon: Icon(
                    Icons.add,
                    color: Colors.black.withOpacity(.5),
                  ),
                  title: 'Add Products & services',
                  subtitle: 'Target your customers through the application',
                ),
                MenuTileWidget(
                  onTap: () {},
                  margin: EdgeInsets.only(top: 10),
                  icon: SvgPicture.asset(
                    'assets/icons/Heart.svg',
                    color: AppColor.secondary.withOpacity(0.5),
                  ),
                  title: 'Wishlist',
                  subtitle: 'Lorem ipsum Dolor sit Amet',
                ),
                MenuTileWidget(
                  onTap: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Show.svg',
                    color: AppColor.secondary.withOpacity(0.5),
                  ),
                  title: 'Last Seen',
                  subtitle: 'Lorem ipsum Dolor sit Amet',
                ),
                MenuTileWidget(
                  onTap: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Heart.svg',
                    color: AppColor.secondary.withOpacity(0.5),
                  ),
                  title: 'Wishlist',
                  subtitle: 'Lorem ipsum Dolor sit Amet',
                ),
                MenuTileWidget(
                  onTap: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Bag.svg',
                    color: AppColor.secondary.withOpacity(0.5),
                  ),
                  title: 'Orders',
                  subtitle: 'Lorem ipsum Dolor sit Amet',
                ),
                MenuTileWidget(
                  onTap: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Wallet.svg',
                    color: AppColor.secondary.withOpacity(0.5),
                  ),
                  title: 'Wallet',
                  subtitle: 'Lorem ipsum Dolor sit Amet',
                ),
                MenuTileWidget(
                  onTap: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Location.svg',
                    color: AppColor.secondary.withOpacity(0.5),
                  ),
                  title: 'Addresses',
                  subtitle: 'Lorem ipsum Dolor sit Amet',
                ),
              ],
            ),
          ),

          // Section 3 - Settings
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    'SETTINGS',
                    style: TextStyle(
                      color: AppColor.secondary.withOpacity(0.5),
                      letterSpacing: 6 / 100,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                MenuTileWidget(
                  onTap: () {},
                  margin: EdgeInsets.only(top: 10),
                  icon: SvgPicture.asset(
                    'assets/icons/Filter.svg',
                    color: AppColor.secondary.withOpacity(0.5),
                  ),
                  title: 'Languages',
                  subtitle: 'Lorem ipsum Dolor sit Amet',
                ),
                MenuTileWidget(
                  onTap: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Log Out.svg',
                    color: Colors.red,
                  ),
                  iconBackground: Colors.red[100],
                  title: 'Log Out',
                  titleColor: Colors.red,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
