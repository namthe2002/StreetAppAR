import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_notification_service/flutter_notification_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_notification_service/flutter_sav_notification.dart'
    as sav_notification;
import 'package:may25proj/firebase_options.dart';
import 'main.config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';


final getIt = GetIt.instance;

late ValueChanged<RemoteMessage> onForeground;
late ValueChanged<RemoteMessage> onBackground;
late ValueChanged<RemoteMessage> onTerminal;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() {
  init(getIt);
  sav_notification.configureDependencies(getIt);
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  print(messaging.getToken().toString());
  // logger.FirebaseMessaging.instance.getToken().toString())
  sav_notification.SavNotification.instance.getUnReadNotification();
  sav_notification.SavNotification.instance.listenComingNotification(
      onTerminal: onTerminal,
      onForeground: onForeground,
      onBackground: onBackground);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterNotificationServicePlugin = FlutterNotificationService();


  @override
  void initState() {
    super.initState();
    initPlatformState();
    // handleNotification();
  }

  // Future<void> handleNotification() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   // logger.FirebaseMessaging.instance.getToken().toString())
  //   sav_notification.SavNotification.instance.getUnReadNotification();
  //   sav_notification.SavNotification.instance.listenComingNotification(
  //       onTerminal: onTerminal,
  //       onForeground: onForeground,
  //       onBackground: onBackground);
  // }


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion =
          await _flutterNotificationServicePlugin.getPlatformVersion() ??
              'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => sav_notification.NotificationPage(),
      )),
    );
  }
}
