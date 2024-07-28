import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/R.dart';


extension CustomTheme on TextTheme {
  TextStyle get inner700_32 =>
      GoogleFonts.inter(
          color: Colors.black,
          fontSize:  28.sp,
          fontWeight: FontWeight.w700,
          height: 32 / 28);

  TextStyle get inner700_18 =>
      GoogleFonts.inter(
          color: Colors.black,
          fontSize:  18.sp,
          fontWeight: FontWeight.w700,
          height: 24 / 18);
  TextStyle get inner600_14 =>
      GoogleFonts.inter(
          color: Colors.black,
          fontSize:  14.sp,
          fontWeight: FontWeight.w600,
          height: 20 / 14);
  TextStyle get inner400_14 =>
      GoogleFonts.inter(
          color: Colors.black,
          fontSize:  14.sp,
          fontWeight: FontWeight.w400,
          height: 20 / 14);
  TextStyle get raleway500_16 =>
      GoogleFonts.raleway(
          color: Colors.black,
          fontSize:  16,
          fontWeight: FontWeight.w500,
          height: 22 / 16);
  TextStyle get title_5 =>
      GoogleFonts.inter(
          color: Colors.black,
          fontSize:  18.sp,
          fontWeight: FontWeight.w700,
          height: 24 / 18);
  TextStyle get normal14Style_1 =>
      GoogleFonts.inter(
          color: Colors.black,
          fontSize:  14.sp,
          fontWeight: FontWeight.w600,
          height: 20 / 14);
  TextStyle get normal14Style_2 =>
      GoogleFonts.inter(
          color: Colors.black,
          fontSize:  14.sp,
          fontWeight: FontWeight.w600,
          height: 18 / 14);
  TextStyle get body16Style =>
      GoogleFonts.inter(
          color: Colors.black,
          fontSize:  16.sp,
          fontWeight: FontWeight.w600,
          height: 22 / 16);

  TextStyle get bold16Style =>
      GoogleFonts.inter(
          color: Colors.green,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          height: 22 / 18);
  TextStyle get bold20Style =>
      GoogleFonts.nunito(
          color: R.color.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w800,
          height: 26 / 22);
  TextStyle get bold23Style =>
      GoogleFonts.nunito(
          color: R.color.white,
          fontSize: 23.sp,
          fontWeight: FontWeight.w800,
          height: 30 / 22);
  TextStyle get bold11Style =>
      GoogleFonts.inter(
          color: Colors.grey,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          height: 14.sp / 11.sp);
  TextStyle get semi20Style =>
      GoogleFonts.inter(
          color: R.color.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: 28.sp / 20.sp);
  TextStyle get bold13Style =>
      GoogleFonts.inter(
          color: Colors.grey,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          height: 16.sp / 13.sp);
  TextStyle get semi16Style =>
      GoogleFonts.inter(
          color: R.color.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          height: 20.sp / 16.sp);
  TextStyle get semi14Style =>
      GoogleFonts.inter(
          color: R.color.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          height: 18.sp / 14.sp);
  // TextStyle get Style =>
  //     GoogleFonts(
  //         color: Colors.black,
  //         fontSize:  16.sp,
  //         fontWeight: FontWeight.w600,
  //         height: 22 / 16);
          
}
