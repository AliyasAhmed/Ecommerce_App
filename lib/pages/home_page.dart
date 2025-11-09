import 'package:app/components/bottom_nav_bar.dart';
import 'package:app/pages/cart_page.dart';
import 'package:app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This selected index is to control the bottom navbar
  int _selectedIndex = 0;

  final List _pages = [
    // shop page
    const ShopPage(),

    // Cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                color: Colors.grey[900],
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Image.asset('lib/images/nike.png', color: Colors.white, width: 150, height: 150),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Divider(color: Colors.grey[800]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text("Home"),
                  textColor: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: Text("About"),
                  textColor: Colors.white,
                ),
              ),
              ],
            ),
          
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text("Logout"),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),

      body: _pages[_selectedIndex],
    );
  }

  // this method will update out selected index
  // when the use taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
