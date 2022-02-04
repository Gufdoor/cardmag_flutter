import "package:card_app/src/app_module.dart";
import "package:card_app/src/i18n/strings.g.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_modular/flutter_modular.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  runApp(TranslationProvider(
      child: ModularApp(module: AppModule(), child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: LocaleSettings.supportedLocales,
      localizationsDelegates: GlobalCupertinoLocalizations.delegates,
      debugShowCheckedModeBanner: false,
      title: "CardMag",
      initialRoute: splashRoute,
    ).modular();
  }
}
