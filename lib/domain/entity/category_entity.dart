class CategoryEntity {
  CategoryEntity({
    this.data,
  });

  List<CategoryDataEntity>? data;
}

class CategoryDataEntity {
  CategoryDataEntity({
    this.id,
    this.name,
    this.image,
  });

  String? id;
  String? name;
  String? image;
}
