import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/dimentions.dart';

class DummySearchWidget1 extends StatelessWidget {
  final Function onTap;
  final String customtext;
  DummySearchWidget1({
    @required this.onTap,
    @required this.customtext,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: Dimentions.height45,
        margin: EdgeInsets.only(top: Dimentions.height10 / 2),
        padding: EdgeInsets.only(left: Dimentions.width15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimentions.radius20 / 2),
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: Dimentions.width10),
              child: SvgPicture.asset(
                'assets/icons/Search.svg',
                color: Colors.black,
                width: Dimentions.width20,
                height: Dimentions.height20,
              ),
            ),
            Text(
              customtext,
              style: TextStyle(
                color: Colors.grey,
                fontSize: Dimentions.font16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
