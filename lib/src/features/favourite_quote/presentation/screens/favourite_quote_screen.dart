import 'package:flutter/material.dart';
import 'package:quotes/src/core/utils/assets_manger.dart';

class FavouriteQuoteScreen extends StatefulWidget {
  const FavouriteQuoteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteQuoteScreen> createState() => _FavouriteQuoteScreenState();
}

class _FavouriteQuoteScreenState extends State<FavouriteQuoteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('favorite screen'),
      ),
    );
  }
}
