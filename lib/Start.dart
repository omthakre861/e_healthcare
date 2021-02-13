import 'package:e_healthcare/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:e_healthcare/Login.dart';
import 'SignUp.dart';
import 'package:e_healthcare/provider/googlein.dart';
class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  navigateToRegister() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  Future<bool> _onbackpressed(){
    return showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Are you sure you wanna exit..?"),
          actions: <Widget>[
            FlatButton(
                onPressed: ()=>Navigator.pop(context,false),
                child: Text("No"),
            ),
            FlatButton(
              onPressed: ()=>Navigator.pop(context,true),
              child: Text("Yes"),
            ),
          ]
        )

    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onbackpressed,

      child: Scaffold(

        body: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              SizedBox(height: 25),

              Container(
                height: 400,

                child: Image(image: AssetImage("images/start.jpg"),
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 1),

              RichText(

                  text: TextSpan(
                      text: 'Welcome to ', style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),

                      children: <TextSpan>[
                        TextSpan(
                            text: 'E-Healthcare', style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange)
                        )
                      ]
                  )
              ),
              SizedBox(height: 10.0),

              Text('The Medical App.', style: TextStyle(color: Colors.black),),

              SizedBox(height: 30.0),


              Row(mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[

                  RaisedButton(
                      padding: EdgeInsets.only(left: 30, right: 30),

                      onPressed: navigateToLogin,
                      child: Text('LOGIN', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.purpleAccent
                  ),

                  SizedBox(width: 20.0),

                  RaisedButton(
                      padding: EdgeInsets.only(left: 30, right: 30),

                      onPressed: navigateToRegister,
                      child: Text('REGISTER', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.lightBlueAccent
                  ),

                ],
              ),

              // SizedBox(height : 20.0),
              //

              Container(
                margin: EdgeInsets.all(25.0),
                child: SignInButton(

                  Buttons.Google,
                  text: "Sign up with Google",

                   onPressed:
                       () {
                        signInWithGoogle().then((result) {
                        if (result != null) {
                        Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                        builder: (context) {
                        return HomePage();
                },
                ),
                );
                }
                });
                   },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ]
                ),
              ),
              Container(
                child: Text(
                    "Made with ❤ in Virar.", style: TextStyle(
                  fontFamily: 'Raleway',
                   // fontStyle:  ,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ],
          ),
        ),

      ),
    );

  }

 }





