import '../Models/float_navigation_bar.dart';
import '../Models/widget_menu.dart';

import 'package:flutter/material.dart';
import '../Models/sliding_cards_view.dart';
import '../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatNavigationBar(),
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MenuHome(title: "Proximas Etapas"),
                SlidingCardsView(),
                MenuHome(title: "Tabela de Pilotos"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
