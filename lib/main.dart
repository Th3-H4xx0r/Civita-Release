import 'package:civita/loginpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: SplashScreen()));

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 3000)).then((_){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Civita',
            style: TextStyle(
                fontSize: 80,
                color: Colors.green.shade300,
                fontFamily: 'Comfortaa'),
          ),
        ),
      ),
    );
  }
}

