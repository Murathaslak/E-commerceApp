import 'package:ecommerce_app/components/custom_buttom.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class ProductDetail extends ConsumerStatefulWidget {
  Product product;
  ProductDetail({required this.product});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              image(),
              title(),
              colors(),
              subDetail(context),
              price(context),
              button()
            ],
          ),
          appBar()
        ],
      ),
    );
  }

  Padding button() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CustomButton(
        onTap: () {},
        text: "Add to cart",
      ),
    );
  }

  Padding price(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Total",
            style: _subTitle,
          ),
          Text(
            "\$${widget.product.price}",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Padding title() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Text(
        widget.product.title,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }

  SafeArea appBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () => Grock.back(),
                icon: const Icon(Icons.arrow_back)),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border_rounded,
                  size: 32,
                  color: Constant.black,
                ))
          ],
        ),
      ),
    );
  }

  Padding subDetail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.descTitle,
            style: _subTitle,
          ),
          const SizedBox(height: 8),
          Text(
            widget.product.descDetail,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }

  Padding colors() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Colors", style: _subTitle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 15,
            children: [
              for (int i = 0; i < widget.product.color.length; i++)
                Container(
                  width: 113,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: widget.product.color[i],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }

  SizedBox image() {
    return SizedBox(
      height: 381,
      width: double.maxFinite,
      child: Hero(
          tag: widget.product.image,
          child: Image.asset(
            widget.product.image,
            fit: BoxFit.contain,
          )),
    );
  }
}

TextStyle _subTitle =
    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold);

/*
AppBar(
        title: null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          size: 32,
          color: Constant.black,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_border_rounded,
                size: 32,
                color: Constant.black,
              ))
        ],
      ),
*/
