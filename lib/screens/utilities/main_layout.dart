import 'package:flutter/material.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  //TODO: add logic to differentiate between Consumer and Business (Change Bottom Nav Bar)
  int _selectedIndex = 0;

  bool _isBusiness = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          if (_isBusiness)
            const BottomNavigationBarItem(
              //Only visible if it is a business account
              icon: Icon(Icons.storefront_outlined),
              label: 'Shop',
            ),
          if (!_isBusiness)
            const BottomNavigationBarItem(
              //Only visible if it is a consumer account
              icon: Icon(Icons.restaurant),
              label: 'Discover',
            ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Order',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Chat',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      body: widget.body,
    );
  }
}
