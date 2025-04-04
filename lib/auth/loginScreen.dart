
import 'package:flutter/material.dart';
import 'package:home_services_app/auth/services/auth_services.dart';
import 'package:home_services_app/auth/signupScreen.dart';

import 'package:get/get.dart';



import '../components/Widgets.dart';
import '../pages/DashBoard.dart';
import '../components/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/logo.jpg"),
            fit: BoxFit.cover
            )
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.3,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Login",
                    style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.orangeAccent),

                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent,width: 2)
                        ),
                      label: Text("E-mail"),
                      hintText: "Enter Your email"
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent,width: 2)
                        ),
                        label: Text("Password"),
                        hintText: "Enter Your password"
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: () async{
                    await AuthServiceHelper.loginWithEmail(_email.text, _password.text).then((value){
                      if(value == "Login Successfully"){
                        Messege.Show(messege: "Login Successfully");
                        Get.to(DashBoardScreen());
                      }
                      else{
                        Messege.Show(messege: "Error: $value");
                      }
                    });
                  }, child: Text("Login",
                  style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold,fontSize: 20),
                  )),
                  gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Need an account?"),
                      TextButton(onPressed: (){
                        Get.to(SignupScreen());
                      }, child: Text("SignUp",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orangeAccent),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
