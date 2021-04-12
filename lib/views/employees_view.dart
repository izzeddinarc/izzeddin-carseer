import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izzeddin/controllers/employees_controller.dart';

class EmployeesPage extends GetView<EmployeesController> {
  EmployeesController _employeesController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.title,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Obx(() {
              if (_employeesController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return _employeesController.employeesList.isEmpty
                    ? Center(
                        child: Wrap(
                          children: [
                            Text(
                              "No available Employees to show",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontSize: 25,
                              ),
                            )
                          ],
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 5),
                        ),
                        itemCount: _employeesController.employeesList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.person,color: Colors.grey),
                                        SizedBox(width:5),
                                        Text(_employeesController.employeesList[index].firstName,
                                        style: TextStyle(fontSize: 18),)
                                      ],),
                                      
                                      Row(children: [
                                        Icon(Icons.work,color: Colors.grey),
                                        SizedBox(width:5),
                                        Text(_employeesController.employeesList[index].position,
                                        style: TextStyle(fontSize: 18),)
                                      ],),
                                      
                                      Row(children: [
                                        Icon(Icons.calendar_view_day,color: Colors.grey),
                                        SizedBox(width:5),
                                        Text(_employeesController.employeesList[index].vacations.toString(),
                                        style: TextStyle(fontSize: 18),)
                                      ],)
                                    ],
                                  ),
                                )),
                          );
                        },
                      );
            }),
          )
        ]),
      ),
    );
  }
}
