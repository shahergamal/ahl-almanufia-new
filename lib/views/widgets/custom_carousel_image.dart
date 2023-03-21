import 'package:flutter/material.dart';

class CustomCarouselImage extends StatelessWidget {
  const CustomCarouselImage({Key key, @required this.customimage});
  final ImageProvider customimage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: customimage,
        ),
      ),
    );
  }
}
