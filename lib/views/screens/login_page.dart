import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/user_controller.dart';
import 'package:marketky/views/screens/page_switcher.dart';
import 'package:marketky/views/screens/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool secourtext = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  var userController = Get.put(UserController());//use it to get email and show it in my app
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar>>
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Sign in',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/icons/Arrow-left.svg'),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      //bottomNavigationBar>>
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => RegisterPage()));
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColor.secondary.withOpacity(0.1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dont have an account?',
                style: TextStyle(
                  color: AppColor.secondary.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' Sign up',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      //body>>
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 24),
          physics: BouncingScrollPhysics(),
          children: [
            // Section 1 - Header
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 12),
              child: Text(
                'Welcome Back Mate ! ❤️',
                style: TextStyle(
                  color: AppColor.secondary,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'poppins',
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 32),
              child: Text(
                'Enjoy the best shopping experience with Ahl, you will find all services and products in one place. ',
                style: TextStyle(
                    color: AppColor.secondary.withOpacity(0.7),
                    fontSize: 12,
                    height: 150 / 100),
              ),
            ),
            // Section 2 - Form
            // Email
            TextFormField(
              validator: ((email) {
                if (email == null ||
                    email.isEmpty ||
                    !email.contains('@') ||
                    !email.contains('.com')) {
                  return 'Please enter vaild email | @ |.com';
                }
                return null;
              }),
              keyboardType: TextInputType.emailAddress,
              controller: emailcontroller,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'youremail@email.com',
                prefixIcon: Container(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Message.svg',
                      color: AppColor.primary),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.border, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            // Password
            TextFormField(
              keyboardType: TextInputType.number,
              controller: passwordcontroller,
              validator: ((pass) {
                if (pass == null || pass.isEmpty || pass.length < 6) {
                  return 'Please enter strong password';
                }
                return null;
              }),
              autofocus: false,
              obscureText: secourtext,
              decoration: InputDecoration(
                hintText: '**********',
                prefixIcon: Container(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Lock.svg',
                      color: AppColor.primary),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.border, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.white,
                filled: true,
                //
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      secourtext = !secourtext;
                    });
                  },
                  icon: secourtext
                      ? SvgPicture.asset('assets/icons/Hide.svg',
                          color: AppColor.primary)
                      : Icon(
                          Icons.visibility_outlined,
                          color: Colors.black,
                        ),
                ),
              ),
            ),
            // Forgot Passowrd
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColor.secondary.withOpacity(0.5),
                      fontWeight: FontWeight.w700),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: AppColor.primary.withOpacity(0.1),
                ),
              ),
            ),
            // Sign In button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.black,
                      content: Text(
                        'Processing Data',
                        style: TextStyle(color: Colors.white),
                      ),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PageSwitcher()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.black,
                      content: Text(
                        'Error',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              },
              child: Text(
                'Sign in',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'poppins'),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                backgroundColor: AppColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void login(email, password) {
  print('loced in succfully');
}
