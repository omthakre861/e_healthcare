
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_healthcare/Start.dart';
import 'package:e_healthcare/provider/googlein.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;


  // ignore: non_constant_identifier_names
  checke_healthcare() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Start()));
      }
    }
    );
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;

      });


    }


  }

  signOut() async {
    _auth.signOut();

  }

  @override
  void initState() {
    super.initState();
    this.checke_healthcare();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: Container(
          child: !isloggedin ? Center(child: CircularProgressIndicator(),) :

          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

              SizedBox(height: 40.0),
                Container(
                  height: 300,
                  child: Image(image: AssetImage("images/welcome.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),

          Container(
            child: CircleAvatar(
              maxRadius: 30,
              backgroundImage: user.photoURL!=null ? NetworkImage(user.photoURL)  : NetworkImage("https://www.clipartkey.com/mpngs/m/152-1520367_user-profile-default-image-png-clipart-png-download.png"),),
            ),


          Container(

            child: Text(
              "Hello ${user.displayName}, you are Logged in as ${user.email}",
              style: TextStyle(
                  fontFamily: 'SourceCodePro',
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),

          RaisedButton(

            padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
            onPressed: (){
              signOut();
              signOutGoogle();

            },
            child: Text('Signout', style: TextStyle(

                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold

            )),

            color: Colors.orange,
            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(20.0),
            ),
          ),

              ],
          ),
        )
    );
  }

}

