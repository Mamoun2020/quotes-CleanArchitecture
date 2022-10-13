import 'package:flutter/material.dart';
import 'package:quotes/src/config/routes/app_routes.dart';
import 'package:quotes/src/config/themes/app_theme.dart';
import 'package:quotes/src/core/utils/app_colors.dart';
import 'package:quotes/src/core/utils/app_strings.dart';

import 'src/features/random_quote/presentation/screens/quote_screen.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),
      // routes: routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home: const QuoteScreen(),
    );
  }
}