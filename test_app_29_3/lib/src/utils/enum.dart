// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../res/R.dart';

enum LanguageType { CHINESE, ENGLISH, VIETNAMESE}

extension LanguageTypeExt on LanguageType {
  // String get name {
  //   switch (this) {
  //     case LanguageType.ENGLISH:
  //       return R.string.english_name.tr();
  //     case LanguageType.CHINESE:
  //       return R.string.chinese_name.tr();
  //     default:
  //       return R.string.chinese_name.tr();
  //   }
  // }

  String get languageCode {
    switch (this) {
      case LanguageType.ENGLISH:
        return 'en';
      case LanguageType.CHINESE:
        return 'zh';
      case LanguageType.VIETNAMESE:
        return 'vi';
      default:
        // return 'vi';
                return 'en';
    }
  }

  Locale get locale {
    switch (this) {
      case LanguageType.ENGLISH:
        return const Locale('en', 'US');
      case LanguageType.CHINESE:
        return const Locale('zh', 'HK');
      case LanguageType.VIETNAMESE:
        return const Locale('vi', 'VI');
      default:
        // return const Locale('vi', 'VI');
        return const Locale('en', 'US');
    }
  }

  static LanguageType getLanguageTypeFromCode(String languageCode) {
    switch (languageCode) {
      case 'en':
        return LanguageType.ENGLISH;
      case 'zh':
        return LanguageType.CHINESE;
      default:
        return LanguageType.ENGLISH;
    }
  }
}

