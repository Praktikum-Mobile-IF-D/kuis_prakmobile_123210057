import 'package:flutter/material.dart';
import 'package:quiz/homepage.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  bool isLoginSuccess = true;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          backgroundColor: Colors.deepPurple[100],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _emailField(),
            _passwordField(),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) => email = value,
        decoration: InputDecoration(
          label: Text("Email"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.purple)
          )
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) => password = value,
        decoration: InputDecoration(
            suffix: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: (isVisible) ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            ),
          label: Text("Password"),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.purple)
            )
        ),
      ),
    );
  }

  Widget _loginButton(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: (isLoginSuccess) ? Colors.deepPurple[100] : Colors.red),
        onPressed: () {
          String text = "";
          if (email == "@sylviathalia.gmail.com" && password == "sylviathalia28") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return Homepage();
          }));
          } else {
            setState(() {
            text = "Login Failed";
            isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(
            content: Text(text),
          backgroundColor: (isLoginSuccess) ? Colors.deepPurple[100] : Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
        ),
      );
  }
}