import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_z/src/services/ResponsiveClass.dart';

extension ResponsiveFont on num {
  double spAdaptive(BuildContext context) {
    final base = sp;

    if (Responsive.isDesktop(context)) {
      return base * 0.75; // أصغر للويب
    } else if (Responsive.isTablet(context)) {
      return base * 0.85; // متوسط
    } else {
      return base * 1.4; // أكبر للموبايل
    }
  }
}
