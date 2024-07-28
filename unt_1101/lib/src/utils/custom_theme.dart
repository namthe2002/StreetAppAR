import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';


extension CustomTheme on TextTheme {
  TextStyle get inner700_32 =>
      GoogleFonts.inter(
          color: Colors.black,
          fontSize:  28,
          fontWeight: FontWeight.w700,
          height: 32 / 28);

  TextStyle get inner600_14 =>
      GoogleFonts.inter(
          color: Colors.black,
          fontSize:  14.sp,
          fontWeight: FontWeight.w600,
          height: 20 / 14);
  TextStyle get raleway500_16 =>
      GoogleFonts.raleway(
          color: Colors.black,
          fontSize:  16.sp,
          fontWeight: FontWeight.w500,
          height: 22 / 16);
}
