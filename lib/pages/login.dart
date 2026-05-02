import 'package:flutter/material.dart';
import 'package:b_store/widget/support_widget.dart';
import 'package:b_store/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              "image/login.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: 60.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    "Welcome to B-Store",
                    style: AppWidget.boldTextstyle(
                      35,
                      const Color.fromARGB(255, 22, 15, 15),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40.0),
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 4,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: AppWidget.semiBoldTextstyle(18, Colors.black),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F5F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: AppWidget.lightTextstyle(
                              16,
                              Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        "Password",
                        style: AppWidget.semiBoldTextstyle(18, Colors.black),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F5F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: AppWidget.lightTextstyle(
                              16,
                              Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: AppWidget.semiBoldTextstyle(
                              16,
                              Color.fromARGB(255, 116, 95, 82),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 116, 95, 82),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: AppWidget.lightTextstyle(16, Colors.black87),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: AppWidget.semiBoldTextstyle(
                                16,
                                Color.fromARGB(255, 116, 95, 82),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
