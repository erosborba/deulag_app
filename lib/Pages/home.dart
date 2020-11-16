import 'package:flutter/material.dart';
import '../Models/sliding_cards_view.dart';
import '../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Proximas Etapas',
                  style: TextStyle(fontSize: 18),
                ),
                SlidingCardsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
