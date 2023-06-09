import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marketky/constant/app_color.dart';

class RegisterPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  bool secourpass1 = true;
  bool secourpass2 = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Sign up',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset('assets/icons/Arrow-left.svg'),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            Get.toNamed("/LoginPage");
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColor.secondary.withOpacity(0.1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                  color: AppColor.secondary.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' Sign in',
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
                'Welcome to Ahl almanufia  👋',
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
            // Section 2  - Form
            // Full Name
            TextFormField(
              controller: fullnameController,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Full Name',
                prefixIcon: Container(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Profile.svg',
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
                fillColor: AppColor.primarySoft,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            // Username
            TextFormField(
              controller: usernameController,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Username',
                prefixIcon: Container(
                  padding: EdgeInsets.all(12),
                  child: Text('@',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary)),
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
                fillColor: AppColor.primarySoft,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
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
              controller: emailController,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
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
                fillColor: AppColor.primarySoft,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            // Password
            TextFormField(
              validator: ((pass) {
                if (pass == null || pass.isEmpty || pass.length < 6) {
                  return 'Please enter strong password';
                }
                return null;
              }),
              controller: passwordController,
              autofocus: false,
              obscureText: secourpass1,
              decoration: InputDecoration(
                hintText: 'Password',
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
                fillColor: AppColor.primarySoft,
                filled: true,
                //
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      secourpass1 = !secourpass1;
                    });
                  },
                  icon: secourpass1
                      ? SvgPicture.asset('assets/icons/Hide.svg',
                          color: AppColor.primary)
                      : Icon(
                          Icons.visibility_outlined,
                          color: Colors.black,
                        ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Repeat Password
            TextFormField(
              validator: ((pass2) {
                if (pass2 == null || pass2.isEmpty || pass2.length < 6) {
                  return 'Please enter strong password';
                } else if (pass2 != passwordController.text) {
                  return 'your password must be matched';
                }
                return null;
              }),
              controller: password2Controller,
              autofocus: false,
              obscureText: secourpass2,
              decoration: InputDecoration(
                hintText: 'Repeat Password',
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
                fillColor: AppColor.primarySoft,
                filled: true,
                //
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      secourpass2 = !secourpass2;
                    });
                  },
                  icon: secourpass2
                      ? SvgPicture.asset('assets/icons/Hide.svg',
                          color: AppColor.primary)
                      : Icon(
                          Icons.visibility_outlined,
                          color: Colors.black,
                        ),
                ),
              ),
            ),
            SizedBox(height: 24),
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        'Processing Data',
                        style: TextStyle(color: Colors.black),
                      ),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                  signup(
                    emailController.text,
                    passwordController.text,
                    fullnameController.text,
                    usernameController.text,
                  );
                  Get.toNamed("/OTPVerificationPage");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        'Error',
                        style: TextStyle(color: Colors.black),
                      ),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              },
              child: Text(
                'Sign up',
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
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
            ),
            // text between button and google button
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'or continue with',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ),
            // SIgn in With Google
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/Google.svg',
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      'Continue with Google',
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                backgroundColor: AppColor.primarySoft,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
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

// ignore: non_constant_identifier_names
void signup(email, password, fullname, Username) {
  print('sign is done');
}
