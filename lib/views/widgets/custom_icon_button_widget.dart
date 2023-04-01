import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/constant/dimentions.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final int value;
  final EdgeInsetsGeometry margin;
  final Function onTap;
  final Color color;

  CustomIconButtonWidget({
    @required this.icon,
    @required this.value,
    @required this.onTap,
    this.margin,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Dimentions.width45,
        height: Dimentions.height45,
        margin: margin,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: Dimentions.width20 * 2,
              height: Dimentions.height20 * 2,
              margin: EdgeInsets.only(
                top: Dimentions.height10,
                bottom: Dimentions.height10 / 2,
                left: Dimentions.width10 / 2,
                right: Dimentions.width10 / 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius15),
              ),
              alignment: Alignment.center,
              child: icon,
            ),
            (value != 0)
                ? Container(
                    width: Dimentions.width20,
                    height: Dimentions.height20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimentions.radius20 * 5,
                      ),
                      color: color,
                    ),
                    child: Text(
                      '$value',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimentions.font16 - 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
