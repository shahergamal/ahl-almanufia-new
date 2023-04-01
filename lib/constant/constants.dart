import 'package:marketky/core/model/product_model.dart';
import '../core/model/category_model.dart';

// craete a lists to add data in this lists

List<ProductModel> products = [];
List<CategoryModel> categories = [];

//removeTags
String removeTags(String text) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  String result = text.replaceAll(exp, '');
  return result;
}

//replaceCharacters
String replaceCharacters(String text) {
  String result = "";
  for (int i = 0; i < text.length; i++) {
    String currentChar = text[i];
    if (currentChar == "<" || currentChar == ">") {
      result += " ";
    } else {
      result += currentChar;
    }
  }
  return result;
}
