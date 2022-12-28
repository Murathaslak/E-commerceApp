import 'package:ecommerce_app/assets.dart';
import 'package:ecommerce_app/model/bottom_nav_bar_model.dart';
import 'package:ecommerce_app/view/account/account.dart';
import 'package:ecommerce_app/view/cart/cart.dart';
import 'package:ecommerce_app/view/category/category.dart';
import 'package:ecommerce_app/view/home/home.dart';
import 'package:ecommerce_app/view/wishlist/wishlist.dart';
import 'package:flutter/material.dart';

class BaseScaffoldRiverpod extends ChangeNotifier {
  List<BottomNavBarModel> items = [
    BottomNavBarModel(image: Assets.icons.icBottomHomeSVG, title: "Home"),
    BottomNavBarModel(image: Assets.icons.icBottomSaveSVG, title: "Wishlist"),
    BottomNavBarModel(
        image: Assets.icons.icBottomCategoriesSVG, title: "Category"),
    BottomNavBarModel(image: Assets.icons.icBottomProfileSVG, title: "Account"),
    BottomNavBarModel(image: Assets.icons.icBottomCartSVG, title: "Cart")
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return Home();
      case 1:
        return Wishlist();
      case 2:
        return Category();
      case 3:
        return Account();
      case 4:
        return Cart();
      default:
        return Home();
    }
  }
}
























    // BottomNavigationBarItem(
    //     icon: SvgPicture.asset(Assets.icons.icBottomHomeSVG), label: "Home"),
    // BottomNavigationBarItem(
    //     icon: SvgPicture.asset(Assets.icons.icBottomSaveSVG),
    //     label: "Wishlist"),
    // BottomNavigationBarItem(
    //     icon: SvgPicture.asset(Assets.icons.icBottomCategoriesSVG),
    //     label: "Category")
    // BottomNavigationBarItem(
    //     icon: SvgPicture.asset(Assets.icons.icBottomProfileSVG),
    //     label: "Account"),
    // BottomNavigationBarItem(
    //   icon: SvgPicture.asset(Assets.icons.icBottomCartSVG),
    //   label: "Cart ",