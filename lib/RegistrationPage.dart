import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vivian_flutter_app/HomePage.dart';
import 'package:vivian_flutter_app/LoginPage.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _registrationPageState();
  }
}

class _registrationPageState extends State<RegistrationPage> {
  TextEditingController emailAddressTC = new TextEditingController();
  TextEditingController passwordTC = new TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool progressIndicatorValue = false;
  bool registerButtonShowValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              addImage(),
              addCard(),
              Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: FlatButton(
                    child: Text(
                      "Already have an account? Login here.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget addImage() {
    AssetImage assetImage = AssetImage("images/reg_icon.png");

    Image image = Image(image: assetImage);

    return SizedBox(
      width: 150.0,
      height: 150.0,
      child: image,
    );
  }

  ///   addCard() - Container Card

  Widget addCard() {
    return Container(
      width: double.infinity,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          elevation: 8.0,
          child: Center(
            child: Container(
              margin: EdgeInsets.all(12.0),
              child: Wrap(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Enter your details here",
                        style: TextStyle(fontSize: 19.0, color: Colors.black),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Full name here",
                              hintText: "Please enter your full name here",
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
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password here",
                              hintText: "Please enter your password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 6.0)),
                        ),
                      ),
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
                                child: Text("Registering your account..."),
                              )
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: registerButtonShowValue,
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 12.0),
                          child: RaisedButton(
                            color: Colors.blue,
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                progressIndicatorValue = true;
                                registerButtonShowValue = false;
                              });

                              firebaseAuth
                                  .createUserWithEmailAndPassword(
                                      email: emailAddressTC.text,
                                      password: passwordTC.text)
                                  .whenComplete(() => goToHomePage());
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  goToHomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));

    Fluttertoast.showToast(
        msg: "Successfully Registered",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1);
  }
} /* End of registration page state */
