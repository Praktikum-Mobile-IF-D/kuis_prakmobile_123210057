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
          title: Text("Login"),
          backgroundColor: Colors.white,
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
            prefixIcon: Icon(Icons.email),
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
          label: Text("Password"),
          prefixIcon: Icon(Icons.lock),
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
          if (email.contains('@') && password.length > 8) {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return Homepage();
            }));
          } else if (!email.contains('@') && password.length < 8){
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          } else if (!email.contains('@')){
            setState(() {
              text = "Email tidak valid";
              isLoginSuccess = false;
            });
          } else if (password.length < 8){
            setState(() {
              text = "Password harus lebih dari 8 karakter";
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