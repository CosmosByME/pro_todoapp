import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class SvgService {
  static String getIcon(String name) {
    return 'assets/icons/$name.svg';
  }

  static SvgPicture getIconWidget(
    String name, {
    double? width,
    double? height,
    Color? color,
  }) {
    return SvgPicture.asset(
      getIcon(name),
      width: width,
      height: height,
      color: color,
    );
  }
}
