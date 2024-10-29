import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:noteydho/config/router.dart';
import 'package:noteydho/config/theme.dart';
import 'package:noteydho/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Nwott AI Note Taker',
      theme: AppThemes.lightTheme, // Set to light theme
      darkTheme: AppThemes.darkTheme, // Set to dark theme
      themeMode: ThemeMode.light, // Use system theme mode
      routerConfig: AppRouter.router,
    );
  }
}
