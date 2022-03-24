import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vbt_hackathon_group3/feature/profile/view/profile_view.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/language_manager.dart';
import 'core/init/theme/app_theme.dart';
import 'firebase_options.dart';
import 'feature/addBook/book_model/productmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

  Hive.registerAdapter(BookModelAdapter());
  await Hive.openBox<BookModel>('books');
  runApp(EasyLocalization(
      child: const MyApp(),
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: AppConstants.langAssetPath));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      title: 'Hackathon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.createThemeData(AppThemeLight()),
      home: const ProfileView(),
    );
  }
}
