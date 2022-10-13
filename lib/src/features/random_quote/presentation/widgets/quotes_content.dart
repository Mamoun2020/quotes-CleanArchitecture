import 'package:flutter/material.dart';
import 'package:quotes/src/core/utils/app_colors.dart';
import 'package:quotes/src/core/utils/app_strings.dart';
import 'package:quotes/src/features/random_quote/domain/entities/quote.dart';

class QuotesContent extends StatelessWidget {
  const QuotesContent({
    Key? key,
    required this.quote,
  }) : super(key: key);
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 8, start: 16, end: 16),
      decoration: BoxDecoration(
        color: AppColors.secondPrimary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            quote.content,
            maxLines: 10,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            quote.author,
            style: TextStyle(
              fontSize: 16,
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
