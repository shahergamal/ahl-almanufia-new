import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/local/local.dart';
import 'package:marketky/views/screens/login_page.dart';
import 'package:marketky/views/screens/otp_verification_page.dart';
import 'package:marketky/views/screens/page_switcher.dart';
import 'package:marketky/views/screens/register_page.dart';
import 'package:marketky/views/screens/welcome_page.dart';
import 'views/screens/addproducts_services.dart';

void main() {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColor.primary,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito',
      ),
      locale: Get.deviceLocale,
      translations: Mylocal(),
      getPages: [
        GetPage(name: "/WelcomeScreen", page: (() => WelcomePage())),
        GetPage(name: "/LoginPage", page: (() => LoginPage())),
        GetPage(name: "/RegisterPage", page: (() => RegisterPage())),
        GetPage(
            name: "/OTPVerificationPage", page: (() => OTPVerificationPage())),
        GetPage(name: "/PageSwitcher", page: (() => PageSwitcher())),
        GetPage(
            name: "/AddProductsservices", page: (() => AddProductsservices())),
      ],
      home: WelcomePage(),
    );
  }
}
