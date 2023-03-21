import 'package:flutter/material.dart';
import 'package:marketky/core/model/product_model.dart';
import 'package:marketky/views/widgets/rating_tag.dart';
import 'package:pecahan_rupiah/pecahan_rupiah.dart';

class ItemCard extends StatelessWidget {
  final ProductModel product;
  final Color titleColor;
  final Color priceColor;

  ItemCard({
    @required this.product,
    this.titleColor = Colors.white,
    this.priceColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ProductDetail(product: product);
        }));
        */
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
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image:
                      NetworkImage(product.mainImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: RatingTag(value: product.rating.toDouble()),
            ),

            // item details
            Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.name}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2, bottom: 8),
                    child: Text(
                      '${Pecahan.rupiah(value: product.price.toInt(), withRp: true)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: priceColor,
                      ),
                    ),
                  ),
                  Text(
                    '${product.metaTitle}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
