class ProductsEntity {
  ProductsEntity({
    this.data,
  });

  List<ProductData>? data;
}

class ProductData {
  ProductData({
    this.ratingsQuantity,
    this.id,
    this.title,
    this.price,
    this.imageCover,
    this.ratingsAverage,
  });

  int? ratingsQuantity;
  String? id;
  String? title;
  int? price;
  String? imageCover;
  double? ratingsAverage;
}
