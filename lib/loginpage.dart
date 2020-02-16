import 'package:civita/ProviderPortal/pending_request_screen.dart';
import 'package:civita/VolunteerPortal/eventinfoscreen.dart';
import 'package:civita/VolunteerPortal/volunteerhomepage.dart';
import 'package:civita/VolunteerPortal/volunteermapscreen.dart';
import 'package:civita/appconfig.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{

  static var _appConfigInstance = new AppConfig();

  var _mainAppFont = _appConfigInstance.mainProgramFont;

  @override
  Widget build(BuildContext context1) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[

                  Container(
                    child: Center(
                      child: Text(
                        'Civita',
                        style: TextStyle(
                            fontSize: 80,
                            color: Colors.green.shade300,
                            fontFamily: _mainAppFont),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    height: 290,
                    width: MediaQuery.of(context1).size.width,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle:
                        TextStyle(fontFamily: _mainAppFont, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.green.shade300,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey[400])),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey[300])),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle:
                        TextStyle(fontFamily: _mainAppFont, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.green.shade300,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey[400])),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey[300])),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PendingRequestsScreen()));
                    },
                    child: Center(
                      child: Text(
                        'Are You a Community Service Provider?',
                        style: TextStyle(
                            color: Colors.green.shade300,
                            fontFamily: 'PlayFair',
                            fontSize: 15),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child:
                      Container(
                        width: 230,
                        height: 60,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: _mainAppFont),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

                  ),
                  SizedBox(
                    height: 50,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

