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
    pageController = PageController(viewportFraction: 0.8);
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
      height: MediaQuery.of(context).size.height * 0.50,
      child: PageView(
        controller: pageController,
        children: [
          SlidingCard(
            name: 'Etapa do Brazil',
            date: '20/10/2020',
            assetName: 'brasil.jpg',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'Etapa do México',
            date: '27/10/2020',
            assetName: 'mexico.jpg',
            offset: pageOffset - 1,
          ),
          SlidingCard(
            name: 'Etapa do México',
            date: '27/10/2020',
            assetName: 'usa.jpg',
            offset: pageOffset - 2,
          ),
        ],
      ),
    );
  }
}
