class CategoryModel {
  //variables
  String id;
  String name;
  String description;
  String seoUrl;
  String metaTitle;
  String metaKeywords;
  String metaDescription;
  bool published;
  String dateAdded;
  String dateModified;
  String parentCategoryId;

  //json data
  CategoryModel.fromjson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    description = data['description'];
    seoUrl = data['seoUrl'];
    metaTitle = data['metaTitle'];
    metaKeywords = data['metaKeywords'];
    metaDescription = data['metaDescription'];
    published = data['published'];
    dateAdded = data['dateAdded'];
    dateModified = data['dateModified'];
    parentCategoryId = data['parentCategoryId'];
  }
}
