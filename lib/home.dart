import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                // Header(),
                SizedBox(height: 40),
                // Tabs(),
                SizedBox(height: 8),
                SlidingCardsView(),
              ],
            ),
          ),
          // ExhibitionBottomSheet(), //use this or ScrollableExhibitionSheet
        ],
      ),
    );
  }
}

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
      height: MediaQuery.of(context).size.height * 0.55,
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

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0), // to make space between
      child: Card(
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
                child: Image.asset(
                  'assets/$assetName',
                  height: MediaQuery.of(context).size.height * 0.3,
                  alignment: Alignment(-offset.abs(), 0),
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: CardContent(
                  name: name,
                  date: date,
                  offset: gauss,
                ),
              ),
            ],
          )),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent({Key key, this.name, this.date, this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(8 * offset, 0),
              child: Text(
                name,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
            SizedBox(height: 8),
            Text(date, style: TextStyle(color: Colors.grey)),
            Spacer(),
            Row(children: [
              RaisedButton(
                color: Color(0xFF162A49),
                child: Text('Reserve'),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                onPressed: () {},
              ),
              Spacer(),
              Text(date,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
            ])
          ],
        ));
  }
}
