import 'package:civita/VolunteerPortal/volunteermapscreen.dart';
import 'package:civita/appconfig.dart';
import 'package:civita/loginpage.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class EventInfoScreen extends StatefulWidget {

  var title = "";
  var date = "";

  EventInfoScreen(String providedTitle, String providedDate){
    title = providedTitle;
    date = providedDate;
  }
  @override
  EventInfoScreenState createState() => EventInfoScreenState(title, date);
}

class EventInfoScreenState extends State<EventInfoScreen> {

  var title = "";
  var date = "";

  EventInfoScreenState(String providedTitle, String providedDate){
    title = providedTitle;
    date = providedDate;
  }

  static var _appConfigInstance = AppConfig();

  var _mainFont = _appConfigInstance.mainProgramFont;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void call(){
    FlutterPhoneState.startPhoneCall("209-650-5503");
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        drawer: _appConfigInstance.appDrawer(context),
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(""),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 5,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "Event Details",
                    style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700, fontFamily: _mainFont),
                  ),
                ],
              )
            ),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 200,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 20,
                  decoration: BoxDecoration(
                      //gradient: LinearGradient(
                          //colors: [Colors.teal, Colors.tealAccent]),
                    color: Colors.green[300],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 2)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 390,
                            padding: EdgeInsets.only(
                                top: 40, left: 20),
                            child: Text(
                              this.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                fontFamily: _mainFont
                              ),
                            ),
                          )
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 20, top: 5),
                            child: Text("Hosted By: The City of Plesanton",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: _mainFont,
                                  fontWeight: FontWeight.w500),),
                          ),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 20, top: 5),
                            child: Text("10/20 Registered",
                              style: TextStyle(color: Colors.white,
                                  fontFamily: _mainFont,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: <Widget>[

                          SizedBox(
                            width: 22,
                          ),

                          OutlineButton(
                            color: Colors.white,
                            borderSide: BorderSide(color: Colors.white),
                            disabledBorderColor: Colors.white,
                            highlightedBorderColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Enroll", style: TextStyle(color: Colors.white, fontFamily: _mainFont),),
                            onPressed: () {
                              Flushbar(
                                title:  "Successfully Enrolled",
                                message:  "You have been successfully enrolled to volunteer for this event.",
                                duration:  Duration(seconds: 3),
                                icon: Icon(Icons.check_circle_outline,size: 35, color: Colors.white,),
                              )..show(context);
                            },
                          )
                        ],
                      ),



                    ],
                  ),
                ),
              ],

            ),

            Container(
              padding: EdgeInsets.only(
                  left: 20,
                  top: 10
              ),
              child: Text("General Info",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, fontFamily: _mainFont),),
            ),

            SizedBox(
              height: 20,
            ),


            Column(
              children: <Widget>[
                Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Center(
                        child: Text("Event Date: $date", style: TextStyle(
                            color: Colors.grey,
                            fontFamily: _mainFont,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),),
                    )
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),

            Column(
              children: <Widget>[
                Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Center(
                      child: Text("Registered Volunteers: 10", style: TextStyle(
                        fontFamily: _mainFont,
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),),
                    )
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),

            Column(
              children: <Widget>[
                Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Center(
                      child: Text("Skill Set Required \n Hard working skills and to stay on task", textAlign: TextAlign.center, style: TextStyle(
                          color: Colors.grey,
                          fontFamily: _mainFont,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),),
                    )
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.only(
                  left: 20,
                  top: 10
              ),
              child: Text("Quick Actions",
                style: TextStyle(fontSize: 25,fontFamily: _mainFont, fontWeight: FontWeight.w800),),
            ),

            SizedBox(
              height: 20,
            ),

            Column(
              children: <Widget>[
                Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: IconButton(icon: Icon(Icons.map, color: Colors.red,), onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => VolunteerMapsScreen()));
                          },),
                        ),

                        Expanded(
                          child: IconButton(icon: Icon(Icons.web),),
                        ),

                        Expanded(
                          child: IconButton(icon: Icon(Icons.phone, color: Colors.green,),
                            onPressed: () {
                            call();

                            },
                          ),
                        ),

                        Expanded(
                          child: IconButton(icon: Icon(Icons.message, color: Colors.blue,),),
                        ),
                      ],
                    )
                ),
              ],
            ),




            ],
        ),
      ),
    );
  }
}
