import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trainee_app/core/route_generator.dart';
import 'package:trainee_app/core/style/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:trainee_app/features/auth/data/api/firebase_api.dart';
import 'package:trainee_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      locale: const Locale('hr'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: RouteGenerator.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
