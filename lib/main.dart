import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentry/sentry.dart';

import 'config/flavor.dart';
import 'global.dart';
import 'routes/app_pages.dart';
import 'widgets/developer_widget.dart';

void main() {
  runZonedGuarded(() async {
    await Sentry.init(
      (options) {
        options.dsn =
            'https://8f96c596bcb0404e80650df83e5cb944@o1149022.ingest.sentry.io/6257332';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
      },
    );
    // Init your App.
    Global.init().then((e) => runApp(const MyApp()));
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DeveloperWidget(
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorSchemeSeed: FlavorConfig.instance.color),
        initialRoute: AppPages.initial,
        unknownRoute: AppPages.unknownRoute,
        getPages: AppPages.routes,
        builder: BotToastInit(),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
  }
}
