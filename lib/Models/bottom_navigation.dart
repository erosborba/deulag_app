import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  Color backgroundColor = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(
        Icon(Icons.home_outlined), Text('Home'), Colors.purpleAccent),
    NavigationItem(
        Icon(Icons.insert_invitation), Text('Etapas'), Colors.amberAccent),
    NavigationItem(
        Icon(Icons.format_list_numbered), Text('Tabela'), Colors.pinkAccent),
    NavigationItem(
        Icon(Icons.sports_motorsports_outlined), Text('Perfil'), Colors.cyan),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      height: double.maxFinite,
      width: isSelected ? 120 : 50,
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              color: item.color)
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(children: [
            IconTheme(
                data: IconThemeData(
                  size: 24,
                  color: isSelected ? backgroundColor : Colors.black,
                ),
                child: item.icon),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: isSelected
                  ? DefaultTextStyle.merge(
                      style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? backgroundColor : null),
                      child: item.title)
                  : Container(),
            )
          ])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 66,
      padding: EdgeInsets.only(left: 20, top: 4, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map(
          (item) {
            var itemIndex = items.indexOf(item);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = itemIndex;
                });
              },
              child: _buildItem(item, selectedIndex == itemIndex),
            );
          },
        ).toList(),
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;
  final Color color;
  NavigationItem(this.icon, this.title, this.color);
}
