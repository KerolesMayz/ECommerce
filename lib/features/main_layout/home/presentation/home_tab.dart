import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/features/main_layout/cubit/main_layout_view_model.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/home_tab_brands_view_model.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/home_tab_categories_view_model.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/home_view_model_state.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final HomeTabCategoriesViewModel homeTabCategoriesViewModel =
      getIt<HomeTabCategoriesViewModel>();
  final HomeTabBrandsViewModel homeTabBrandsViewModel =
      getIt<HomeTabBrandsViewModel>();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    homeTabCategoriesViewModel.getCategories();
    homeTabBrandsViewModel.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => homeTabCategoriesViewModel),
        BlocProvider(create: (context) => homeTabBrandsViewModel),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<HomeTabCategoriesViewModel, HomeTabCategoriesState>(
              builder: (context, state) {
                switch (state) {
                  case HomeTabCategoriesLoadingState():
                    return Center(
                      child: SizedBox(
                          width: 100.w,
                          height: 100.h,
                          child: Center(
                              child: SizedBox(
                                  width: 50.w,
                                  height: 50.h,
                                  child: CircularProgressIndicator()))),
                    );
                  case HomeTabCategoriesErrorState():
                    return Text(state.message);
                  case HomeTabCategoriesSuccessState():
                    return Column(
                      children: [
                        CustomAdsWidget(),
                        CustomSectionBar(
                            sectionNname: 'Categories',
                            function: () {
                              BlocProvider.of<MainLayoutViewModel>(context)
                                  .changeSelectedIndex(1);
                            }),
                        SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: ()=> BlocProvider.of<MainLayoutViewModel>(context)
                                    .goToCategoriesView(index),
                                child: CustomCategoryWidget(
                                    category: state.categories[index]),
                              );
                            },
                            itemCount: state.categories.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        ),
                      ],
                    );
                }
              },
            ),

            BlocBuilder<HomeTabBrandsViewModel, HomeTabBrandsViewModelState>(
              builder: (context, state) {
                switch (state) {
                  case HomeTabBrandsViewModelLoadingState():
                    return SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: Center(
                            child: SizedBox(
                                width: 50.w,
                                height: 50.h,
                                child: CircularProgressIndicator())));
                  case HomeTabBrandsViewModelErrorState():
                    return Text(state.message);
                  case HomeTabBrandsViewModelSuccessState():
                    return Column(
                      children: [
                        SizedBox(height: 12.h),
                        CustomSectionBar(
                            sectionNname: 'Brands', function: () {}),
                        SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomBrandWidget(
                                brand: state.brands[index],
                              );
                            },
                            itemCount: 20,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        ),
                      ],
                    );
                }
              },
            ),
            // todo: in case we add most selling products
            // CustomSectionBar(
            //   sectionNname: 'Most Selling Products',
            //   function: () {},
            // ),
            // SizedBox(
            //   child: SizedBox(
            //     height: 360.h,
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) {
            //         return const ProductCard(
            //           title: "Nike Air Jordon",
            //           description:
            //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
            //           rating: 4.5,
            //           price: 1100,
            //           priceBeforeDiscound: 1500,
            //           image: ImageAssets.categoryHomeImage,
            //         );
            //       },
            //       itemCount: 20,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 12.h)
          ],
        ),
      ),
    );
  }
}
