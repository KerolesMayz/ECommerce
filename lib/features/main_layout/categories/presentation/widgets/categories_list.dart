import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key,required this.selectedIndex});

  final int selectedIndex;

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: ColorManager.containerGray,
        border: Border(
            // set the border for only 3 sides
            top: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withValues(alpha: 0.3)),
            left: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withValues(alpha: 0.3)),
            bottom: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withValues(alpha: 0.3))),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12),
          bottomLeft: Radius.circular(AppSize.s12),
        ),
      ),

      // the categories items list
      child: ClipRRect(
        // clip the corners of the container that hold the list view
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12),
          bottomLeft: Radius.circular(AppSize.s12),
        ),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => CategoryItem(index,
              "Laptops & Electronics", selectedIndex == index, onItemClick),
        ),
      ),
    ));
  }

  // callback function to change the selected index
  void onItemClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
