import 'package:deulag_app/Models/classification.dart';
import 'package:deulag_app/Models/leaderboard.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MenuHome(line1: "Proximas ", line2: "Etapas"),
              SlidingCardsView(),
              MenuHome(line1: "Classificação ", line2: "Pilotos"),
              LeaderBoard(),
            ],
          ),
        ),
      ),
    );
  }
}
