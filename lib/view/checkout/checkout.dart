import 'package:ecommerce_app/components/custom_payment_method.dart';
import 'package:ecommerce_app/components/custom_shipping_information.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/riverpod/checkout_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

final checkoutRiverpod = ChangeNotifierProvider(((ref) => CheckoutRiverpod()));

class CheckoutView extends ConsumerWidget {
  CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(checkoutRiverpod);
    var read = ref.read(checkoutRiverpod);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          "checkout",
          style: TextStyle(color: Constant.black, fontSize: 18),
        ),
        leading: IconButton(
          onPressed: () => Grock.back(),
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
          ),
          color: Constant.black,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 27.0,
              top: 39,
              right: 26,
            ),
            child: Column(
              children: [
                shippingInformationTitle(),
                ShippingInformation(
                    shippingInformationModel: read.myInformation),
                PaymentMethodBoard(
                  paymentMethod: watch.paymentMethod,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Row shippingInformationTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Shipping Information",
          style: _style,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 4.0),
          child: Text(
            "change",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Constant.yellow),
          ),
        )
      ],
    );
  }
}

TextStyle _style = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
