import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/src/features/favourite_quote/presentation/screens/favourite_quote_screen.dart';
import 'package:quotes/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/src/features/random_quote/presentation/screens/quote_screen.dart';

import '../../../injection_container.dart';

class Routes {
  static const String initialRoute = '/';
  static const String favouriteQuote = '/favouriteQuote';
}
// final routes = {
//   Routes.initialRoute: (context) =>QuoteScreen(),
//   Routes.favouriteQuote: (context) => FavouriteQuoteScreen(),
// };

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => sl<RandomQuoteCubit>(),
                child: const QuoteScreen()));
      case Routes.favouriteQuote:
        return MaterialPageRoute(
            builder: (context) => const FavouriteQuoteScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: Text('No Route Found'),
              ),
            ));
  }
}
