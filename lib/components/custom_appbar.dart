import 'package:ecommerce_app/assets.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/view/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  String appBarTitle;

  CustomAppbar({Key? key, this.appBarTitle = "iDrip"})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        style:
            const TextStyle(color: Constant.black, fontWeight: FontWeight.bold),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          Assets.icons.icDrawerSVG,
        ),
      ),
      actions: [
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: ((context) => CheckoutView())),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              Assets.icons.icSearchSVG,
            ),
          ),
        ),
      ],
      backgroundColor: Constant.darkWhite,
    );
  }
}
