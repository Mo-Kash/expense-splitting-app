import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import '../pages/groups_page.dart';
import '../pages/expense_page.dart';
import '../pages/activity_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  int _selectedIndex = 0;
  //to control bottom navbar
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const GroupsPage(),
    const ExpensePage(),
    const ActivityPage(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index)=>navigateBottomBar(index),

      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.teal
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
              "assets/images/revsplitLogo.png",
              height: 60,
              width: 60
          ),
        )
      ),
      body: _pages[_selectedIndex],
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                "assets/images/revsplitLogo.png"
              )
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(
                    Icons.person_pin,
                  color: Colors.teal,
                ),
                title: Text(
                    "My Account",
                  style: TextStyle(
                    color: Colors.teal[800],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(
                    Icons.settings,
                  color: Colors.teal,
                ),
                title: Text(
                    "Settings",
                  style: TextStyle(
                    color: Colors.teal[800],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
