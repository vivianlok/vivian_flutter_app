import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vivian_flutter_app/HomePage.dart';
import 'package:vivian_flutter_app/RegistrationPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginPageState();
  }
}

class _loginPageState extends State<LoginPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController emailAddressTC = new TextEditingController();
  TextEditingController passwordTC = new TextEditingController();

  bool progressIndicatorValue = false;
  bool loginButtonShowValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[addImage(), addCard(), addRegistrationBtn()],
          ),
        ),
      ),
    );
  }

  Widget addImage() {
    return Image.asset(
      "images/login.png",
      width: 200.0,
      height: 200.0,
    );
  }

  Widget addCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.0),
      child: Card(
          elevation: 9.0,
          shadowColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Container(
            margin: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Welcome back! Login here",
                  style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12.0),
                  child: TextFormField(
                    controller: emailAddressTC,
                    decoration: InputDecoration(
                        labelText: "Email address",
                        hintText: "Please enter your email address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 6.0)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12.0),
                  child: TextFormField(
                    controller: passwordTC,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Please enter your password here",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 8.0)),
                    obscureText: true,
                  ),
                ),

                /// Progress indicator goes here

                Visibility(
                  visible: progressIndicatorValue,
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Container(
                            margin: EdgeInsets.only(left: 15.0),
                            child: Text("Logging in")),
                      ],
                    ),
                  ),
                ),

                Visibility(
                  visible: loginButtonShowValue,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 19.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      color: Colors.blue,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          progressIndicatorValue = true;
                          loginButtonShowValue = false;
                        });
                        firebaseAuth
                            .signInWithEmailAndPassword(
                                email: emailAddressTC.text,
                                password: passwordTC.text)
                            .whenComplete(() => goToHomepage());
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget addRegistrationBtn() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: FlatButton(
        child: Text(
          "New user? Sign up here",
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegistrationPage()));
        },
      ),
    );
  }

  goToHomepage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    Fluttertoast.showToast(
        msg: "Successfully Logged In",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1);
  }
}
