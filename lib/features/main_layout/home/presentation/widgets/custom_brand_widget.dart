import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/domain/entity/brand_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandWidget extends StatelessWidget {
  const CustomBrandWidget({super.key,required this.brand});
  final BrandDataEntity brand;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 100.h,
          width: 100.w,
          fit: BoxFit.cover,
          imageUrl: brand.image??'',
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}