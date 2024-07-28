import 'package:MyApp/res/R.dart';
import 'package:MyApp/src/app.dart';
import 'package:MyApp/src/localization/localization.dart';
import 'package:MyApp/src/page/profile/profile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(Localization.getLocalizationWidget(app: MyApp()));
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
  }
}


class MyApp extends StatelessWidget with WidgetsBindingObserver {
   MyApp({super.key});
  String? _defaultLocale;

  @override
  initState() {
    WidgetsBinding.instance.addObserver(this);
    //Listen to Auth State changes (_user is up-to-date)
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(context, child) =>  MaterialApp(
        theme: _buildTheme(),
        localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: Text('asd'),
      ),
    );
  }

   ThemeData _buildTheme() {
     var baseTheme = ThemeData(
       primaryColor: R.color.white,
       brightness: Brightness.light,
       backgroundColor:R.color.white,
       scaffoldBackgroundColor:R.color.white,
       dialogBackgroundColor: R.color.white,
       fontFamily: "inter",
       colorScheme: ColorScheme.fromSwatch().copyWith(secondary: R.color.black),
     );
     // return baseTheme;
     return baseTheme.copyWith(
       textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
     );
   }
}
