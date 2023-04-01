import 'package:marketky/api_constants.dart';

class ProductModel {
  //variables
  String id;
  String name;
  double price;
  var oldPrice;
  String description;
  String mainImage;
  List productImages;
  String seoUrl;
  String metaTitle;
  String metaKeywords;
  String metaDescription;
  int rating;
  int reviewCount;
  String dateAdded;
  List categories;
  //
  List manufacturers;
  //مواصفات المنتج
  List specifications;

  //json data
  ProductModel.fromjson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    price = data['price'];
    oldPrice = data['oldPrice'];
    description = data['description'];
    mainImage = '${ApiConstants.baseUrl }'+'${data['mainImage']}';
    productImages =data['productImages'];
    seoUrl = data['seoUrl'];
    metaTitle = data['metaTitle'];
    metaKeywords = data['metaKeywords'];
    metaDescription = data['metaDescription'];
    rating = data['rating'];
    reviewCount = data['reviewCount'];
    dateAdded = data['dateAdded'];
    categories = data['categories'];
    manufacturers = data['manufacturers'];
    specifications = data['specifications'];
  }
}
