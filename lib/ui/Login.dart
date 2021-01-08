import 'package:brainants_todoapp/service/authentication/authentication.dart';
import 'package:brainants_todoapp/ui/Registration.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key=GlobalKey<FormState>();

  String em='';
  String pass='';

  AuthService _auth=AuthService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                validator: (res){
                  if(res.isEmpty) {
                    return "Enter Email";
                  }
                  else{
                    return null;
                  }

                },

                onChanged: (val){
                  setState(() {
                    em=val;
                  });

                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                obscureText: true,
                validator: (res){
                  if(res.isEmpty) {
                    return "Enter Password";
                  }

                },
                onChanged: (val){
                  setState(() {
                    pass=val;
                  });

                },
              ),
              SizedBox(height: 10,),

              FlatButton(onPressed: () async{


                if(_key.currentState.validate()) {
                  await _auth.signInUser(em, pass);


                }

              }, child:
              Text("Login")),
              SizedBox(height: 10,),
              FlatButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext cntxt) => Registration()));
              }, child: Text("Don't Have an account \n Register Now.."))
            ],
          ),
        ),
      ),
    );
  }
}
