import 'dart:io';
import 'package:MyApp/src/page/repair/repair.dart';

import '../constants/constants.dart';
import '../main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../res/R.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class App extends StatefulWidget {

  App({Key? key}) : super(key: key);

  static _AppState? of(BuildContext context) => context.findAncestorStateOfType<_AppState>();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  List<Locale>? _systemLocales;
  String? _defaultLocale;
  Locale? _locale;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _systemLocales = WidgetsBinding
        .instance.window.locales; // Returns the list of locales that user defined in the system settings.

    if (kIsWeb) {
      _defaultLocale = 'en_US'; // Returns locale string in the form 'en_US'
    } else {
      _defaultLocale = Platform.localeName;
    }
    _locale = Locale(_defaultLocale!);

    //Listen to Auth State changes (_user is up-to-date)
  }

  //Updates state when user state changes in the app
  // updateUserState(User? user) {
  //   setState(() {
  //     _user = user;
  //   });
  // }

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  // void getCountry() async {
  //   Uri url = Uri(
  //     scheme: 'http',
  //     host: 'ip-api.com',
  //     path: 'json',
  //     //queryParameters: {'apikey': 'ae055430-995c-11ec-bdfe-6fc73f877843'},
  //   );
  //   http.Response response = await http.post(url);
  //   if (response.statusCode == 200) {
  //     dynamic strMap = jsonDecode(response.body);
  //     Globals.REGION = strMap['countryCode'] == "TH" ? "BKK" : strMap['countryCode'];
  //     // Globals.REGION = "HK"; // Default
  //   }
  //   else {
  //     Globals.REGION = "HK"; // Default
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: kIsWeb ? const Size(1440, 1024) : const Size(360, 640),
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              title: "DragonRewards",
              theme: _buildTheme(),
              localizationsDelegates: context.localizationDelegates,
              // supportedLocales: context.supportedLocales,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              navigatorObservers: [routeObserver],
              // builder: (context, widget) {
              //   if (kIsWeb) {
              //     return ResponsiveWrapper.builder(
              //       widget,
              //       minWidth: 480,
              //       defaultScale: true,
              //       breakpoints: [
              //         const ResponsiveBreakpoint.resize(480, name: MOBILE),
              //         const ResponsiveBreakpoint.autoScale(768, name: TABLET),
              //         const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              //       ],
              //     );
              //   } else {
              //     return widget ?? Container();
              //   }
              // },
              // routes: {
              //   Routes.homePage: (context) {
              //     return const NavbarMainPage(
              //       defaultIndex: 0,
              //     );
              //   },
              //   Routes.voucherPage: (context) {
              //     return const NavbarMainPage(
              //       defaultIndex: 1,
              //     );
              //   },
              //   Routes.topUpPage: (context) {
              //     return const NavbarMainPage(
              //       defaultIndex: 2,
              //     );
              //   },
              //   Routes.mapPage: (context) {
              //     return const NavbarMainPage(
              //       defaultIndex: 3,
              //     );
              //   },
              //------
              //Routes.mainPage: (context)    { return NavbarMainPage(defaultIndex: 0,); },
              //Routes.homePage: (context)   { return HomePage(title: R.string.homePage); },
              //Routes.voucherPage: (context){ return VoucherPage(title: R.string.voucherTitle); },
              //Routes.topUpPage: (context)  { return TopUpPage(title: R.string.topUp); },
              // Routes.charityPage: (context) {
              //   return CharityMainPage(title: R.string.charity.tr());
              // },
              // Routes.registerPage: (context) {
              //   return RegisterPage(title: R.string.registeraccount.tr());
              // },
              // Routes.loginPage: (context) {
              //   return const LoginPage();
              // },
              // Routes.profilePage: (context) {
              //   return ProfilePage(title: R.string.profile.tr());
              // },
              // Routes.faqPage: (context) {
              //   return FaqPage(title: R.string.faqtitle.tr());
              // },
              // Routes.txHistoryPage: (context) {
              //   return TxHistoryPage(title: R.string.transactionhistory.tr());
              // },
              // /*
              //   Routes.messagePage: (context) {
              //     return MessagePage(
              //         title: R.string.myMessages);
              //   },*/
              // Routes.qrPage: (context) {
              //   return TopUpPage(title: R.string.scanqrtitle.tr());
              // },
              // Routes.settingsPage: (context) {
              //   return SettingsPage(title: R.string.settings.tr());
              // },
              // Routes.privacyPage: (context) {
              //   return PrivacyPage(title: R.string.privacypolicy.tr());
              // },
              // Routes.voucherActivePage: (context) {
              //   return VoucherActivePage(title: R.string.myvouchers.tr());
              // },
              // Routes.ROUTE_USER_SETTING: (context) => const UserSettingPage(),
              // Routes.ROUTE_TRANSACTION_HISTORY: (context) => const TransactionHistoryPage(),
              // Routes.ROUTE_TOP_UP: (context) => const TopUpPage(),
              // Routes.ROUTE_MY_VOUCHERS: (context) => const MyVouchersPage(),
              // Routes.ROUTE_FAQS: (context) => const FaqsPage(),
              // Routes.ROUTE_ABOUT_US: (context) => const AboutUsPage(),
              // Routes.ROUTE_TERM_OF_USE: (context) => const TermsOfUsePage(),
              // Routes.ROUTE_PRIVACY_POLICY: (context) => const PrivacyPolicyPage(),
              // Routes.ROUTE_MAP: (context) => const MapFullPage(),
              // Routes.ROUTE_TRANSACTION: (context) => const MapFullPage(),
              //Routes.vouchersIssued: (context) { return VoucherActivePage( 'Thank you') },
              home: const RepairPage(),
            );
          }
    );
  }


  ThemeData _buildTheme() {
    var baseTheme = ThemeData(
      primaryColor: R.color.white,
      brightness: Brightness.light,
      backgroundColor: R.color.black,
      scaffoldBackgroundColor: R.color.black,
      dialogBackgroundColor: R.color.black,
      fontFamily: "inter",
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: R.color.black),
    );
    // return baseTheme;
    return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    }
    super.didChangeAppLifecycleState(state);
  }
}
