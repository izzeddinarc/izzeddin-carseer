  
import 'package:get/get.dart';
import 'package:izzeddin/models/employees_model.dart';
import 'package:izzeddin/services/remote_services.dart';

class EmployeesController extends GetxController {
  final String title = 'Employees';
  var isLoading = true.obs;
  var employeesList = List<EmployeesModel>().obs;

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  void fetchEmployees() async {
    try {
      isLoading(true);
      var employees = await RemoteServices().fetchEmployees();
      if (employees != null) {
        employeesList.assignAll(employees);
      }
    } finally {
      isLoading(false);
    }
  }
}