import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/shipping_information_model.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class ShippingInformation extends StatelessWidget {
  ShippingInformationModel shippingInformationModel;
  ShippingInformation({super.key, required this.shippingInformationModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        height: 166,
        width: 364,
        decoration: BoxDecoration(
          color: Constant.white,
          borderRadius: 10.allBR,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 15)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            shippinInformationBoard(
                shippingInformationModel.name, Icons.person_outline),
            shippinInformationBoard(
                shippingInformationModel.addres, Icons.location_on_outlined),
            shippinInformationBoard(
                shippingInformationModel.phone, Icons.phone_outlined),
          ],
        ),
      ),
    );
  }

  Row shippinInformationBoard(String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 30, right: 11.0),
            child: Icon(icon)),
        Text(
          text,
          style: _style,
        ),
      ],
    );
  }
}

TextStyle _style = TextStyle(fontSize: 17, fontWeight: FontWeight.w400);
