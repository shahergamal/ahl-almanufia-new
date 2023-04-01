import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/constant/dimentions.dart';
import 'package:marketky/core/model/product_model.dart';
import 'package:marketky/views/screens/product_detail.dart';
import 'package:marketky/views/widgets/rating_tag.dart';
import 'package:pecahan_rupiah/pecahan_rupiah.dart';

//create avariable as ProductModel
//ingect as (product.name )

class ItemCard extends StatelessWidget {
  final ProductModel product;
  final Color titleColor;
  final Color priceColor;

  ItemCard({
    @required this.product,
    this.titleColor = Colors.white,
    this.priceColor = AppColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetail(product: product));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 16 - 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // item image
            Container(
              width: MediaQuery.of(context).size.width / 2 - 16 - 8,
              height: MediaQuery.of(context).size.width / 2 - 16 - 8,
              padding: EdgeInsets.only(
                top: Dimentions.height10,
                bottom: Dimentions.height10,
                left: Dimentions.width10,
                right: Dimentions.width10,
              ),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20 / 2),
                image: DecorationImage(
                  image: NetworkImage(product.mainImage),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: RatingTag(
                value: product.rating.toDouble(),
              ),
            ),

            // item details
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Dimentions.height15,
                horizontal: Dimentions.width10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.name}',
                    style: TextStyle(
                        fontSize: Dimentions.font20 / 1.5,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimentions.height10/3, bottom: Dimentions.height10),
                    child: Text(
                      '${Pecahan.rupiah(value: product.price.toInt(), withRp: true)}',
                      style: TextStyle(
                        fontSize: Dimentions.font16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: priceColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
