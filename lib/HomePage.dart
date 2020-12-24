import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vivian_flutter_app/LoginPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courier App"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: addDrawerHeaderContents(),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Track Parcel"),
            ),
            ListTile(
              title: Text("Contact Us"),
            ),
            ListTile(
              title: Text("About Us"),
            ),
            ListTile(
              title: Text("Log out"),
              onTap: () {
                FirebaseAuth firebaseAuth = FirebaseAuth.instance;

                firebaseAuth.signOut().whenComplete(() => returnToLoginPage());
              },
            ),
          ],
        ),
      ),
      body: Container(
          margin: EdgeInsets.all(3.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            elevation: 7.0,
            shadowColor: Colors.blue,
            child: ListView(
              children: <Widget>[
                addImage(),
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: addOtherContents(),
                )
              ],
            ),
          )),
    );
  }

  Widget addImage() {
    return Image.asset(
      "images/delivery_image.jpg",
    );
  }

  Widget addOtherContents() {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
              labelText: "Pickup Address",
              hintText: "Please enter your pickup address here...",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0)),
        ),
        Image.asset(
          "images/line.png",
          width: 70.0,
          height: 50.0,
        ),
        Container(
          ///margin: EdgeInsets.only(top: 20.0),
          child: TextFormField(
            decoration: InputDecoration(
                labelText: "Dropoff Address",
                hintText: "Please enter your drop off address...",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12.0),
          child: TextFormField(
            decoration: InputDecoration(
                labelText: "Note to Driver",
                hintText: "Please enter your note to driver",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          width: double.infinity,
          height: 50.0,
          child: RaisedButton(
            color: Colors.blue,
            child: Text(
              "Request for Pickup",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0)),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 20.0),
            width: double.infinity,
            height: 50.0,
            child: RaisedButton(
                color: Colors.green,
                child: Text(
                  "Call us now",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0)))),
      ],
    );
  }

  Widget addDrawerHeaderContents() {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Image.asset(
            "images/default_avatar.png",
            width: 80.0,
            height: 80.0,
          ),
          Container(
            child: Text(
              "Full Name Goes Here",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.only(top: 12.0),
          )
        ],
      ),
    );
  }

  returnToLoginPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
    Fluttertoast.showToast(msg: "Successfully Signed Out", toastLength:  Toast.LENGTH_SHORT,timeInSecForIosWeb: 1);
  }
}
