  
import 'package:get/get.dart';
import 'package:izzeddin/models/vacations_model.dart';
import 'package:izzeddin/services/remote_services.dart';

class VacationsController extends GetxController {
  final String title = 'Vacations';
  var isLoading = true.obs;
  var employeesList = List<VacationsModel>().obs;

  @override
  void onInit() {
    fetchVacations();
    super.onInit();
  }

  void fetchVacations() async {
    try {
      isLoading(true);
      var employees = await RemoteServices().fetchVacations();
      if (employees != null) {
        employeesList.assignAll(employees);
      }
    } finally {
      isLoading(false);
    }
  }
}