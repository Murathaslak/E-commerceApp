import 'package:ecommerce_app/assets.dart';
import 'package:ecommerce_app/model/payment_method.dart';
import 'package:ecommerce_app/model/shipping_information_model.dart';
import 'package:flutter/material.dart';

class CheckoutRiverpod extends ChangeNotifier {
  ShippingInformationModel myInformation = ShippingInformationModel(
      name: "jane alderson",
      addres: "221B Baker Street\nLondon , UK",
      phone: "+123456789");

  PaymentMethodModel paymentMethod = PaymentMethodModel(
    imageVisa: Assets.images.visaPNG,
    imageMaster: Assets.images.masterPNG,
    imageBank: Assets.images.bankPNG,
  );
}
