import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kriptobakkal/constants/color_constant.dart';
import 'package:kriptobakkal/custom_icons/flutter_custom_icon.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class CryptoPay extends StatefulWidget {
  @override
  _CryptoPayState createState() => _CryptoPayState();
}

class _CryptoPayState extends State<CryptoPay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text('Pay with Crypto'),
          ),
          Container(
            height: 56,
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: kGradientSlideButton,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.mirror,
                stops: const <double>[0.0, 1.0],
              ),
            ),
            child: ConfirmationSlider(
              onConfirmation: () {},
              height: 56,
              width: MediaQuery.of(context).size.width - 32,
              backgroundColor: Colors.transparent,
              shadow: BoxShadow(color: Colors.transparent),
              foregroundColor: kWhiteColor,
              foregroundShape: BorderRadius.circular(8),
              icon: MyFlutterApp.slide_icon,
              iconColor: kBlueColor,
              text: 'Slide for Payment',
              textStyle: GoogleFonts.nunito(
                  fontSize: 14, color: kWhiteColor, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
