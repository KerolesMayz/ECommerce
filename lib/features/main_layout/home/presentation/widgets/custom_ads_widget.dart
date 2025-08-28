import 'dart:async';

import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAdsWidget extends StatefulWidget {
  const CustomAdsWidget({
    super.key,
  });

  @override
  State<CustomAdsWidget> createState() => _CustomAdsWidgetState();
}

class _CustomAdsWidgetState extends State<CustomAdsWidget> {
  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];
  int currentIndex=0;
  late final Timer timer;

  void _startImageSwitching() {
    timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1500),
            child: Image.asset(
              height: 210.h,
              width: double.infinity,
              adsImages[currentIndex],
              key: ValueKey<int>(currentIndex),
            ),
          ),
          SizedBox(
            height: 210.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: adsImages.map((image) {
                int index = adsImages.indexOf(image);
                return Container(
                  width: 8.w,
                  height: 8.h,
                  margin: EdgeInsets.symmetric(
                    horizontal: 4.0.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? ColorManager.primary
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
