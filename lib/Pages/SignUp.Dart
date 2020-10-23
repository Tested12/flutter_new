import 'file:///C:/Users/user/AndroidStudioProjects/flutter_new/lib/Pages/Home.Dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/Pages/Login.Dart';

class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignUp();
  }
}
class _SignUp extends State<SignUp>
{
  final formKey = new GlobalKey<FormState>();
  String UserName="";
  String Password="";
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: TextFormField(
                  decoration: new InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Input User Name"),
                  validator: (v) {
                    if (v.trim() == "") return "Username is required";
                    if (v.trim().length < 6)
                      return "Username must contain at least 6 char";
                    return null;
                  },
                  onSaved: (v)
                  {
                    UserName=v.trim();
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: TextFormField(
                  // obscureText: true,
                  decoration: new InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Input Password"),
                  validator: (v) {
                    if (v.trim() == "") return "Password is required";
                    if (v.trim().length < 6)
                      return "Password must contain at least 6 char";
                    return null;
                  },
                  onSaved: (v)
                  {
                    Password=v.trim();
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: RaisedButton(
                  color: Colors.red,
                  child: Text(
                    "SignUP",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {

                    if (formKey.currentState.validate()) {
                      //// all field valid
                      formKey.currentState.save();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Home()));

                    }
                  },
                ),
              ),
              FlatButton(
                child: Text("Login"),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Login()));
                },
              ),
            ],
          ),
        ));
  }
}