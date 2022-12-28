import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/view/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(baseScaffoldRiverpod);
    var read = ref.read(baseScaffoldRiverpod);
    return Container(
      width: Grock.width,
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: const BoxDecoration(
          color: Constant.darkWhite,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 8),
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < read.items.length; i++)
            Stack(
              clipBehavior: Clip.none,
              children: [
                GrockContainer(
                  onTap: () {
                    read.setCurrentIndex(i);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(read.items[i].image,
                          color: i == watch.currentIndex
                              ? Constant.orange
                              : Constant.black),
                      const SizedBox(height: 5),
                      Text(
                        read.items[i].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: i == watch.currentIndex
                                ? Constant.orange
                                : Constant.black),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: i == watch.currentIndex,
                  child: Positioned.fill(
                    top: -34,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 2,
                        width: 32,
                        decoration: const BoxDecoration(
                          color: Constant.orange,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}


/*
BottomNavigationBar(
      items: read.items,
      currentIndex: watch.currentIndex,
      onTap: (newPageIndex) => read.setCurrentIndex(newPageIndex),
      backgroundColor: Constant.darkWhite,
      selectedItemColor: Constant.orange,
      unselectedItemColor: Constant.black,
      selectedIconTheme: const IconThemeData(color: Constant.orange),
    );

*/