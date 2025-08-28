class BrandEntity {
  BrandEntity({
    this.data,
  });

  List<BrandDataEntity>? data;
}

class BrandDataEntity {
  BrandDataEntity({
    this.id,
    this.image,
  });

  String? id;
  String? image;
}
