import 'package:ecommerce_app/features/main_layout/categories/presentation/categories_tab.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/favourite_screen.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_tab.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/presentation/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutViewModel extends Cubit<int> {
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];
  MainLayoutViewModel() : super(0);
  void changeSelectedIndex(int selectedIndex) {
    if(state==selectedIndex)return;
    emit(selectedIndex);
  }
}
