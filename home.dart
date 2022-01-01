import 'package:flutter/material.dart';
import 'package:flutterflow/hotel_carousel.dart';

import 'destination_carousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  int _currentTab = 0;

  List<IconData> icons = [Icons.favorite, Icons.home, Icons.search, Icons.add];

  /*List<Widget> iconsList = <Widget>[
	  const _buildIcon(0),
	  
  ];*/

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        //print(_currentIndex); to make sure it works
      },
      child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: _currentIndex == index
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(30)),
          child: Icon(icons[index],
              size: 25,
              color: _currentIndex == index
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 60.0, top: 30.0),
                child: Text(
                  'What would you like to find?!',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 20, //adding a SB for some spacing
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /*icons.asMap().entries.map((MapEntry map) => (map.key).toList(),*/
                //я не знаю как это исправить
                _buildIcon(0),
                _buildIcon(1),
                _buildIcon(2),
                _buildIcon(3),
              ],
            ),
            const SizedBox(height: 20.0), //adding padding
            const DestinationCarousel(),
            const SizedBox(height: 20.0),
            const HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        iconSize: 11,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
              ),
              label: 'favorite'),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
              ),
              label: 'account'),
        ],
      ),
    );
  }
}
