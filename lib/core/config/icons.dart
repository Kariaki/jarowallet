import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const baseAssets = 'assets';

class AppIcon {
  static Widget getsvg(String svg) {
    return SvgPicture.asset(
      '$baseAssets/$svg.svg',
    );
  }
  static Widget deleteIcon = SvgPicture.asset('$baseAssets/delete.svg');
  static Widget masterCardIcon = SvgPicture.asset('$baseAssets/mastercard.svg');
  static Widget visaCardIcon = SvgPicture.asset('$baseAssets/visa.svg');
  static Widget cartIcon = SvgPicture.asset('$baseAssets/cart.svg');
  static Widget walletCreditCardIcon = SvgPicture.asset('$baseAssets/wallet-credit-card.svg');
  static Widget radioOffIcon = SvgPicture.asset('$baseAssets/radio-off.svg');
  static Widget radioOnIcon = SvgPicture.asset('$baseAssets/radio-on.svg');
}
