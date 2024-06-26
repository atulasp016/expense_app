import 'package:expense_app/data/repository/local/database_helper.dart';
import 'package:expense_app/domain/routes/app_routes.dart';
import 'package:expense_app/domain/utils/app_colors.dart';
import 'package:expense_app/domain/utils/app_images.dart';
import 'package:expense_app/domain/widgets/button_widgets.dart';
import 'package:expense_app/presentation/pages/home/add_expense.dart';
import 'package:expense_app/presentation/pages/home/home_page.dart';
import 'package:expense_app/presentation/pages/home/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBNB extends StatefulWidget {
  const HomeBNB({super.key});

  @override
  State<HomeBNB> createState() => _HomeBNBState();
}

class _HomeBNBState extends State<HomeBNB> {
  int selectedIndex = 0;

  List<Widget> navPages = [
    HomePage(),
    Container(
      color: Colors.orange.shade100,
      child: const Center(
        child: Text('Explore',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
    ),
    AddExpenseScreen(balance: 0),
    Container(
      color: Colors.green.shade100,
      child: const Center(
        child: Text('Notification',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
    ),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: ColorsConstant.mainText_Color,
        selectedItemColor: ColorsConstant.primary_Color,
        currentIndex: selectedIndex,
        elevation: 7,
        iconSize: 30,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(ImageConstant.ic_home,
                  width: 25, height: 25, fit: BoxFit.fill),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset(ImageConstant.ic_graph,
                  width: 25, height: 25, fit: BoxFit.fill),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: Image.asset(ImageConstant.ic_add,
                  width: 40, height: 40, fit: BoxFit.fill),
              label: 'Add'),
          BottomNavigationBarItem(
              icon: Image.asset(ImageConstant.ic_notification,
                  width: 25, height: 25, fit: BoxFit.fill),
              label: 'Notification'),
          BottomNavigationBarItem(
              icon: Image.asset(ImageConstant.ic_profile,
                  width: 25, height: 25, fit: BoxFit.fill),
              label: 'Profile'),
        ],
      ),
    );
  }
}
