import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/src/core/utils/app_colors.dart';
import 'package:quotes/src/core/utils/app_strings.dart';
import 'package:quotes/src/core/utils/assets_manger.dart';
import 'package:quotes/src/core/widgets/quotes_app_bar.dart';
import 'package:quotes/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/src/core/widgets/error_widget.dart' as error_widget;
import '../widgets/quotes_content.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
        appBar: const QuoteAppBar(
          title: AppStrings.quoteTitle,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
              builder: (_, state) {
                if (state is RandomQuoteIsLoading) {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.primary,
                    ),
                  );
                } else if (state is RandomQuoteError) {
                  return const error_widget.ErrorWidget();
                } else if (state is RandomQuoteLoaded) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      QuotesContent(quote: state.quote),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => _getRandomQuote,
                        child: CircleAvatar(
                          radius: 32,
                          child: Image.asset(ImageAssets.reload,
                              fit: BoxFit.cover,
                              width: 24,
                              color: AppColors.white),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.primary,
                    ),
                  );
                }
              },
            )),
      ),
    );
  }
}

/*
*
*
* InkWell(
        onTap: () => Navigator.pushNamed(
            context, Routes.favouriteQuote),
        // onTap: ()=> Constants.showErrorDialog(context: context, msg: 'Error test dialog'),
        child: Center(
          child: Image.asset(ImageAssets.quotes,

          width: context.size?.width,),
        ),
      ),
      // body: InkWell(
      //   onTap: () => Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const FavouriteQuoteScreen())),
      //   child: Center(
      //     child: Image.asset(ImageAssets.quotes),
      //   ),
      // ),
* */
