import 'package:flutter/material.dart';

// ignore: camel_case_types
class customcartcategory extends StatelessWidget {
  const customcartcategory({
    Key key,
    @required this.customimage,
    @required this.customtext,
    @required this.onPressed,
  });
  final ImageProvider customimage;
  final String customtext;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              height: 70,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                color: Colors.transparent,
                image: DecorationImage(
                  image: customimage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              customtext,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
