import 'package:flutter/material.dart';
import 'package:marketky/views/widgets/custom_app_bar.dart';
import 'package:marketky/views/widgets/custom_text.dart';

import '../../constant/app_color.dart';

class AddProductsservices extends StatefulWidget {
  AddProductsservices({Key key}) : super(key: key);

  @override
  State<AddProductsservices> createState() => _AddProductsservicesState();
}

class _AddProductsservicesState extends State<AddProductsservices> {
  final TextEditingController titlecontroller = TextEditingController();

  final TextEditingController desccontroller = TextEditingController();

  final TextEditingController pricecontroller = TextEditingController();

  List categoryItems = [
    'cat name 1',
    'cat name 2',
    'cat name 3',
    'cat name 4',
    'cat name 5'
  ];

  String value;

  @override
  Widget build(BuildContext context) {
    DropdownMenuItem<dynamic> buildMenuItem(dynamic item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            CustomAppBar(
              title: 'Add Your Products or Services',
              leftIcon: Icon(Icons.arrow_back_ios),
              leftOnTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 15,
            ),
            Form(
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  //title
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: titlecontroller,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Your Title',
                      prefixIcon: Container(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.title,
                          color: Colors.black,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.border, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //desc
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: desccontroller,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Your Description...',
                      prefixIcon: Container(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.description,
                          color: Colors.black,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 14, right: 14, bottom: 100, top: 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.border, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //price
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true, signed: true),
                    controller: pricecontroller,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'price',
                      prefixIcon: Container(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.attach_money_outlined,
                          color: Colors.black,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.border, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //old price
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true, signed: true),
                    controller: pricecontroller,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'old price',
                      prefixIcon: Container(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.attach_money_outlined,
                          color: Colors.black,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.border, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ],
              ),
            ),
            //main image
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: MyText(
                customText: 'Main Image',
                customsize: 14,
                customweight: FontWeight.w800,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 16 - 8,
              height: MediaQuery.of(context).size.height / 2 - 16 - 8,
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('assets/categoryimg/main picture.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Icon(
                Icons.add_a_photo,
                color: Colors.white,
              ),
            ),
            //productImages
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: MyText(
                customText: 'product images',
                customsize: 14,
                customweight: FontWeight.w800,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/categoryimg/main picture.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/categoryimg/main picture.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/categoryimg/main picture.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/categoryimg/main picture.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/categoryimg/main picture.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: MyText(
                customText: 'category',
                customsize: 14,
                customweight: FontWeight.w800,
              ),
            ),
            //DropdownButton
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text('Choose from categories..'),
                  value: value,
                  isExpanded: true,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  items: categoryItems.map(buildMenuItem).toList(),
                  onChanged: ((value) {
                    setState(() {
                      return this.value = value;
                    });
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: MyText(
                customText: 'Add communication with you 😊',
                customsize: 14,
                customweight: FontWeight.w800,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //face book
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/categoryimg/facebook.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Text('Face book')
                      ],
                    ),
                  ),
                ),
                //Instagram
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/categoryimg/Instagram_logo_2016.svg.webp'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Text('Instagram')
                      ],
                    ),
                  ),
                ),
                //whats app
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/categoryimg/whatsapp.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Text('whats app')
                      ],
                    ),
                  ),
                ),
                //location
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/categoryimg/locaton pin.jpeg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Text('Location')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //button
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Add Now',
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
