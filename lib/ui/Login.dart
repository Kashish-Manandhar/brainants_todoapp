import 'package:brainants_todoapp/service/authentication/authentication.dart';
import 'package:brainants_todoapp/ui/HomePage.dart';
import 'package:brainants_todoapp/ui/Registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key=GlobalKey<FormState>();
  String em="";
  String pass="";
  AuthService _auth=AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            validator: (val)=>(val.isEmpty)?"Enter the email":null,
            onChanged: (val){
              setState(() {
                em=val;
              });
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Enter your Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            validator: (val)=>(val.isEmpty)?"Enter the password":null,
            onChanged: (val){
              setState(() {
                pass=val;
              });
            },
          ),
          RaisedButton(onPressed: () async{
            if(_key.currentState.validate())
              {
                final user=await _auth.signInUser(em, pass);
                if(user==null)
                {

                }
                else
                {
                  _key.currentState.reset();
                  await Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomePage()));

                }
              }


          },child: Text("Login"),),
          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Registration()));
          },
          child: Text(
            "Don't have an Account ? \nRegister"
          ),)
        ],
      ),
      
    );
  }
}
