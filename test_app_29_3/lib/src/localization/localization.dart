// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'csv_loader/csv_asset_loader.dart';
//
// class Localization {
//   static const String languageFilePath = 'lib/res/translations/langs.csv';
//   static Widget getLocalizationWidget({required Widget app}) {
//     return EasyLocalization(
//         path: languageFilePath,
//         useOnlyLangCode: true,
//         saveLocale: false,
//         assetLoader: CsvAssetLoader(),
//         supportedLocales: const [],
//         child: app);
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../utils/enum.dart';
import '../utils/logger.dart';
import 'csv_loader/csv_asset_loader.dart';

class Localization {
  static List<Locale> supportedLanguage = [
    LanguageType.ENGLISH.locale,
  ];
  static const String languageFilePath = 'lib/res/translations/langs.csv';

  static Widget getLocalizationWidget({required Widget app}) {
    return EasyLocalization(
        supportedLocales: supportedLanguage,
        path: languageFilePath,
        fallbackLocale: LanguageType.ENGLISH.locale,
        startLocale: LanguageTypeExt.getLanguageTypeFromCode('en').locale,
        useOnlyLangCode: true,
        saveLocale: false,
        assetLoader: CsvAssetLoader(),
        child: app);
  }

  static LanguageType get currentLanguage =>
      LanguageTypeExt.getLanguageTypeFromCode('en');
  static bool get isLanguageEn => currentLanguage == LanguageType.ENGLISH;
}
