import 'package:ecommerce_app/data/model/metadata_response_data_model.dart';
import 'package:ecommerce_app/domain/entity/category_entity.dart';

class CategoryResponseDataModel extends CategoryEntity {
  CategoryResponseDataModel({
    this.results,
    this.metadata,
    super.data,
  });

  CategoryResponseDataModel.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? MetadataResponse.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDataResponseDataModel.fromJson(v));
      });
    }
  }

  int? results;
  MetadataResponse? metadata;
}

class CategoryDataResponseDataModel extends CategoryDataEntity {
  CategoryDataResponseDataModel({
    super.id,
    super.name,
    this.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryDataResponseDataModel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? slug;
  String? createdAt;
  String? updatedAt;
}
