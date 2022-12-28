import 'package:ecommerce_app/components/product_card.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/home_products_model.dart';
import 'package:ecommerce_app/riverpod/home_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRiverpod = ChangeNotifierProvider((ref) => HomeRiverpod());

class Home extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(homeRiverpod);
    var read = ref.read(homeRiverpod);
    return Scaffold(
      body: ListView(
        children: [
          campaigns(read, watch),
          space(),
          homeProductCategories(read.hotDeals),
          homeProductCategories(read.mostPopular),
        ],
      ),
    );
  }

  SizedBox space() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget homeProductCategories(HomeProductsModel model) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 25, right: 20, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.categoryTitle,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              const Text(
                "See All",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xffA6A6AA)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 276,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            padding:
                const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
            itemCount: model.products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCard(product: model.products[index]);
            },
          ),
        )
      ],
    );
  }

  SizedBox campaigns(HomeRiverpod read, HomeRiverpod watch) {
    return SizedBox(
      height: 210,
      child: Stack(
        children: [campaignsPageView(read, watch), campaignsDot(read, watch)],
      ),
    );
  }

  Align campaignsDot(HomeRiverpod read, HomeRiverpod watch) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < read.campaigns.length; i++)
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: watch.campaignsCurrentIndex == i
                      ? Constant.white
                      : Constant.gray,
                ),
              ),
          ],
        ),
      ),
    );
  }

  PageView campaignsPageView(HomeRiverpod read, HomeRiverpod watch) {
    return PageView.builder(
        controller: read.pageController,
        itemCount: read.campaigns.length,
        itemBuilder: (context, index) => Image.asset(watch.campaigns[index]),
        onPageChanged: (newPageValue) => read.setCampaignsIndex(newPageValue));
  }
}
