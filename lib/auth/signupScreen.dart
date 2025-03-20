
import 'package:flutter/material.dart';
import 'package:home_services_app/auth/loginScreen.dart';
import 'package:home_services_app/auth/services/auth_services.dart';
import 'package:home_services_app/pages/DashBoard.dart';
import 'package:home_services_app/pages/Homepage.dart';

import '../utils/toast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.3,),
                  Text("SignUp",
                    style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold,color: Colors.blue),
          
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("E-mail"),
                        hintText: "Enter Your email"
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Password"),
                        hintText: "Enter Your password"
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: () async {
                    await AuthServiceHelper.createAccountWithEmail(_email.text, _password.text)
                        .then((value){
                          if(value == "Account Created"){
                            Messege.Show(messege: "Account Created");
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardScreen()));
                          }
                          else{
                            Messege.Show(messege: "Error: $value");
                          }
                    });
                  }, child: Text("SignUp")),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      }, child: Text("Login"))
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
