import 'package:flutter/material.dart';

import 'sliding_card.dart';

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.6);
    pageController.addListener(
      () {
        setState(
            () => pageOffset = pageController.page); //listener and set state
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      child: PageView(
        controller: pageController,
        children: [
          SlidingCard(
            name: 'Etapa do Brazil',
            pista: 'Interlagos',
            date: '20/10',
            assetName: 'brasil.jpg',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'Etapa do México',
            pista: 'Hermanos Rodrigues',
            date: '27/10',
            assetName: 'mexico.jpg',
            offset: pageOffset - 1,
          ),
          SlidingCard(
            name: 'Etapa do México',
            pista: 'Austin',
            date: '04/11',
            assetName: 'usa.jpg',
            offset: pageOffset - 2,
          ),
        ],
      ),
    );
  }
}
