import 'package:ecommerce_app/domain/entity/brand_entity.dart';
import 'package:ecommerce_app/data/model/metadata_response_data_model.dart';

class BrandResponseDataModel extends BrandEntity{
  BrandResponseDataModel({
      this.results, 
      this.metadata, 
      super.data,});

  BrandResponseDataModel.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? MetadataResponse.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BrandDataResponseDataModel.fromJson(v));
      });
    }
  }
  int? results;
  MetadataResponse? metadata;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['results'] = results;
  //   if (metadata != null) {
  //     map['metadata'] = metadata?.toJson();
  //   }
  //   if (data != null) {
  //     map['data'] = data?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }

}

class BrandDataResponseDataModel extends BrandDataEntity{
  BrandDataResponseDataModel({
      super.id,
      this.name, 
      this.slug, 
      super.image,
      this.createdAt, 
      this.updatedAt,});

  BrandDataResponseDataModel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['_id'] = id;
  //   map['name'] = name;
  //   map['slug'] = slug;
  //   map['image'] = image;
  //   map['createdAt'] = createdAt;
  //   map['updatedAt'] = updatedAt;
  //   return map;
  // }

}