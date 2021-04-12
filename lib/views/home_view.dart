import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izzeddin/controllers/employees_controller.dart';
import 'package:izzeddin/controllers/navi_bar_controller.dart';
import 'package:izzeddin/controllers/vacation_controller.dart';
import 'package:izzeddin/views/employees_view.dart';
import 'package:izzeddin/views/vacation_view.dart';

class HomeView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<NaviBarController>(() => NaviBarController());
    Get.lazyPut<EmployeesController>(() => EmployeesController());
    Get.lazyPut<VacationsController>(() => VacationsController());
    return GetBuilder<NaviBarController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                EmployeesPage(),
                VacationPage()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: 'Employees',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.sunrise,
                label: 'Vacations',
              )
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({IconData icon, String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}