import 'package:flutter/material.dart';
import 'package:warehouse_ms/features/home/presentation/pages/home.dart';
import 'package:warehouse_ms/features/profile/presentation/pages/profile_page.dart';
import 'package:warehouse_ms/features/statistic/presentation/pages/statistic_page.dart';
import 'package:warehouse_ms/features/warehouse/presentation/pages/warehouse_item_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  // List of pages to navigate
  final List<Widget> _pages = [
    HomePage(),
    WarehouseCrudPage(), // Shows warehouse items
    StatisticsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black, // Set the background color to black
        selectedItemColor: Colors.white, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warehouse),
            label: 'Warehouse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
