import 'package:brainants_todoapp/service/authentication/authentication.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _key = GlobalKey<FormState>();
  String em = '';
  String pass = '';
  String name = '';

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _key,
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Enter your name";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Enter your email";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        em = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    obscureText: true,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Enter your name";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        pass = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                      onPressed: () async {
                        if (_key.currentState.validate()) {
                          await _authService.createUser(em, pass);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text("Register User")),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Aldready have an account? \n Go to Login"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
