import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:izzeddin/controllers/login_controller.dart';
import 'package:izzeddin/views/employees_view.dart';
import 'package:izzeddin/views/home_view.dart';

class LoginPage extends StatelessWidget {
  final _passwordController = TextEditingController();
    final _emailController = TextEditingController();
    

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final _controller = Get.put(LoginController());

    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(70),
                  bottomRight: const Radius.circular(70),
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8.0,
                                ),
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            child: Container(
                              height: size.height * 0.5,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 24,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Login",
                                        style: TextStyle(
                                          fontSize: size.height / 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailController,
                                      //TODO:construct onchanged
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                          ),
                                          labelText: 'Username'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: _passwordController,
                                      obscureText: true,
                                      //TODO: construct onchanged
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.grey,
                                        ),
                                        labelText: 'Password',
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(top: 40),
                                          child: Container(
                                            height: 1.4 * size.height / 20,
                                            width: 5 * size.width / 10,
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 5.0,
                                                primary: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30.0),
                                                ),
                                              ),
                                              onPressed: () async  {
                                                  int res= await _controller.login(
                                                      _emailController.text,
                                                      _passwordController.text);
                                                  if(res==-1)
                                                  {
                                                     Get.defaultDialog(
                                            title: "Oops!", middleText: "Something went wrong");
                                                  }
                                                  else
                                                  {
                                                    Get.off(()=>HomeView());
                                                  }
                                                
                                              },
                                              child: Text(
                                                "Login",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: 1.5,
                                                  fontSize: size.height / 40,
                                                ),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                  
                                  if (_controller.loginProcess.value ==true)
                                    Center(
                                      child: CircularProgressIndicator(),
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                 
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
