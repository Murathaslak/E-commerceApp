import 'package:ecommerce_app/components/custom_buttom.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class PaymentMethodBoard extends StatefulWidget {
  PaymentMethodModel paymentMethod;
  PaymentMethodBoard({super.key, required this.paymentMethod});

  @override
  State<PaymentMethodBoard> createState() => _PaymentMethodBoardState();
}

class _PaymentMethodBoardState extends State<PaymentMethodBoard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 265,
            width: 364,
            decoration: BoxDecoration(
              color: Constant.white,
              borderRadius: 10.allBR,
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 15)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Text(
                    "Payment Method",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                paymentMethod(
                    widget.paymentMethod.imageVisa, "**** **** **** 1234"),
                paymentMethod(
                    widget.paymentMethod.imageMaster, "**** **** **** 1234"),
                paymentMethod(
                    widget.paymentMethod.imageBank, "**** **** **** 1234"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text("Total",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
                Text("\$1898",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
                width: 364,
                child: CustomButton(onTap: () {}, text: "Confirm & Pay")),
          )
        ],
      ),
    );
  }

  Row paymentMethod(String image, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(value: 1, groupValue: "null", onChanged: (index) {}),
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 20),
          child: SizedBox(
              width: 70,
              height: 40,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              )),
        ),
        Text(
          text,
          style: _style,
        ),
      ],
    );
  }
}

TextStyle _style = const TextStyle(fontSize: 17, fontWeight: FontWeight.w500);
