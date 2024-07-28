import '../src/localization/localization.dart';
import 'generated/colors.g.dart';
import 'generated/drawables.g.dart';
import 'generated/strings.g.dart';
class R {
  R._();
  static final drawable = Drawables();
  static final string = Strings();
  static final color = Colors();
  static String tr({required String? en, required String? ch}) {
    return Localization.isLanguageEn ? en ?? "" : ch ?? "";
  }
}