import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/products.dart';
import 'package:ecommerce_app/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class ProductCard extends StatelessWidget {
  Product product;
  ProductCard({super.key, required this.product});

  Widget build(BuildContext context) {
    return GrockContainer(
      onTap: () => Grock.to(ProductDetail(product: product)),
      width: 150,
      decoration: const BoxDecoration(
        color: Constant.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8),
        ],
      ),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.image,
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    product.title,
                    style: const TextStyle(fontSize: 15),
                  )),
                  product.isSaved
                      ? const Icon(
                          Icons.bookmark_border_rounded,
                          color: Constant.black,
                        )
                      : const Icon(
                          Icons.bookmark,
                          color: Constant.orange,
                        )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "\$${product.price}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Constant.orange,
                    size: 22,
                  ),
                  Text(
                    "${product.star}",
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
