import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:izzeddin/models/employees_model.dart';
import 'dart:convert';

import 'package:izzeddin/models/login_model.dart';
import 'package:izzeddin/models/vacations_model.dart';
class RemoteServices {
  static var client = http.Client();
  String url= 'http://193.200.241.201:9971/api';

  Future<LoginModel> login(String username, String password) async {
    String request ='$url/Users/ValidateUser';
    var data = {
      "username": username,
      "password": password,
    };

    final response = await http.post(
      Uri.parse(request),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
   
      dynamic jsonString = response.body;
      return loginModelFromJson(jsonString);
     
  }

   Future<List<EmployeesModel>> fetchEmployees() async {
    String request =
        '$url/Employee/GetEmployees';
    

    final response = await http.get(
      Uri.parse(request),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        
      },
    );
    if (response.statusCode == 200) {
      List responseJson = jsonDecode(response.body);
      return responseJson.map((m) => new EmployeesModel.fromJson(m)).toList();
    } else {
      //show error message
      return null;
    }
  }

  Future<List<VacationsModel>> fetchVacations() async {
    String request =
        '$url/Employee/GetVacationRequests';
    

    final response = await http.get(
      Uri.parse(request),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        
      },
    );
    if (response.statusCode == 200) {
      List responseJson = jsonDecode(response.body);
      return responseJson.map((m) => new VacationsModel.fromJson(m)).toList();
    } else {
      //show error message
      return null;
    }
  }
  
}