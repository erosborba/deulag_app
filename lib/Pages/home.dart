import 'package:deulag_app/Models/widget_menu.dart';

import '../Models/bottom_navigation.dart';
import 'package:flutter/material.dart';
import '../Models/sliding_cards_view.dart';
import '../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
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
