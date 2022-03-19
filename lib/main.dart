import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vbt_hackathon_group3/core/init/lang/locale_keys.g.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/language_manager.dart';
import 'core/init/theme/app_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(
      child: const MyApp(),
      supportedLocales: LanguageManager.instance.supportedLanguages,
      startLocale: LanguageManager.instance.trLocale,
      path: AppConstants.langAssetPath));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.createThemeData(AppThemeLight()),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.appBar_title.tr()),
        ),
        body: Center(
          child: Container(
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
