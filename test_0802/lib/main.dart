import 'package:MyApp/src/app.dart';
import 'package:MyApp/src/localization/localization.dart';
import 'package:MyApp/src/page/profile/profile.dart';
import 'package:MyApp/src/page/repair/repair.dart';
import 'package:MyApp/src/page/sevice/service.dart';
import 'package:MyApp/src/utils/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(Localization.getLocalizationWidget(app: MyApp()));
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    logger.d('${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    logger.d('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.d('$transition');
    super.onTransition(bloc, transition);
  }
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  MyApp({super.key});

  List<Locale>? _systemLocales;
  String? _defaultLocale;
  Locale? _locale;

  @override
  initState() {
    WidgetsBinding.instance.addObserver(this);
    _systemLocales = WidgetsBinding.instance.window
        .locales; // Returns the list of locales that user defined in the system settings.

    _locale = Locale(_defaultLocale!);

    //Listen to Auth State changes (_user is up-to-date)
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'test_0802',
        home: ProfilePage(),
      ),
    );
  }
}
