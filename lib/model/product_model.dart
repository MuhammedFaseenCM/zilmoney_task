class ProductModel {
  int? id;
  String? title;
  num? price;
  String? description;

  String? image;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json['price'],
      description: json['description'],
      image: json['image'],
    );
  }
}

List<ProductModel> parseListProduct(List json) {
  List<ProductModel> productList = [];
  for (var i = 0; i < json.length; i++) {
    final product = json[i];

    productList.add(ProductModel.fromJson(product));
  }
  print(productList);
  return productList;
}
