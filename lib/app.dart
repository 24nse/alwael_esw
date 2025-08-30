import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_barsh_web/pages/about_page.dart';
import 'package:profile_barsh_web/utlis/app_router.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeData baseTheme = ThemeData(
    //   colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E3A8A)),
    //   useMaterial3: true,
    //   // textTheme: GoogleFonts.cairoTextTheme(),
    // );
    final _router = AppRouter.instance.router;

    return MaterialApp.router(
      routerConfig: _router,

      debugShowCheckedModeBanner: false,
      title: ' بارشيد - للمقاولات العامة',
      // theme: baseTheme,
      // locale: const Locale('ar'),
      // supportedLocales: const [Locale('ar'), Locale('en')],
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      builder: (context, child) {
        // Force RTL for Arabic
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );
  }
}


