import 'package:get/get.dart';
import 'package:izzeddin/controllers/employees_controller.dart';
import 'package:izzeddin/controllers/navi_bar_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NaviBarController>(() => NaviBarController());
    Get.lazyPut<EmployeesController>(() => EmployeesController());
    
  }
}