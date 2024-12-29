// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreenWidget()
    );
  }
}

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<StatefulWidget> createState() =>
      HomeScreenState();
}

class HomeScreenState extends State<HomeScreenWidget> {
  int _selectedNavIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget> [
    HomeScreen(key: Key('home-screen'),),
    Text(
      'Index 1: Notification',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Flutter'),),
      body: Center(
        child: _widgetOptions.elementAt(_selectedNavIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notification'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'Profile'
            ),
          ],
          currentIndex: _selectedNavIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
      ),
    );
  }
}

class CounterModel extends ChangeNotifier {

}
