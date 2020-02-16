import 'package:civita/appconfig.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class ManageEvents extends StatefulWidget {
  @override
  ManageEventsState createState() => ManageEventsState();
}

class ManageEventsState extends State<ManageEvents> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DatabaseReference reference = FirebaseDatabase.instance.reference();

  List pendingEvents = [];
  List finishedEvents = [];

  List enrolleddata = [
    [
      "Pleasanton Senior Center",
      "Helped with entertaining the elderly and cleaning up"
    ],
    ["Central Park", "Cleaing up trash and helped with the lawn mowing"]
  ];

  TextEditingController starttimecontroller = TextEditingController();
  TextEditingController endtimecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  var _appConfigInstance = AppConfig();

  void showAddHours(context1) {
    showModalBottomSheet(
        context: context1,
        clipBehavior: Clip.hardEdge,
        isDismissible: true,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setter) {
              return KeyboardAvoider(
                autoScroll: false,
                curve: Curves.fastLinearToSlowEaseIn,
                child: Container(
                  color: Color(0xFF737373),
                  child: Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(bottom: 150),
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Placeholder(
                              fallbackHeight: 5,
                              color: Colors.transparent,
                            ),
                            Container(
                              height: 10,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Add Hours",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Start Time",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 80,
                              //width: 400,
                              padding: EdgeInsets.only(
                                  left: 30, right: 30, bottom: 20),
                              child: TextField(
                                maxLength: 20,
                                controller: starttimecontroller,
                                decoration: InputDecoration(
                                  //labelText: "Prize",
                                  suffixIcon: Icon(
                                    Icons.timer,
                                    color: Colors.green.shade300,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "End Time",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 30, right: 30, bottom: 50),
                              child: TextField(
                                controller: endtimecontroller,
                                decoration: InputDecoration(
                                    //labelText: "Prize Place",
                                    suffixIcon: Icon(
                                  Icons.timer,
                                  color: Colors.green.shade300,
                                )),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Service Description",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 30,
                                right: 30,
                              ),
                              child: TextField(
                                controller: descriptioncontroller,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(
                                  Icons.description,
                                  color: Colors.green.shade300,
                                )),
                              ),
                            ),
                            Placeholder(
                              fallbackHeight: 30,
                              color: Colors.transparent,
                            ),
                            SizedBox(
                              height: 50,
                              width: 300,
                              child: RaisedButton(
                                color: Colors.green.shade300,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () async {
                                  await _appConfigInstance.updateHours(
                                      starttimecontroller.text,
                                      endtimecontroller.text,
                                      descriptioncontroller.text);

                                  starttimecontroller.clear();
                                  endtimecontroller.clear();
                                  descriptioncontroller.clear();

                                  Navigator.pop(context);

                                  Flushbar(
                                    title: "Successfully logged",
                                    message:
                                        "You have been successfully logged to hours for this event.",
                                    duration: Duration(seconds: 3),
                                    icon: Icon(
                                      Icons.check_circle_outline,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                  )..show(context);

                                  pendingEvents.add([
                                    starttimecontroller.text,
                                    endtimecontroller.text,
                                    "1",
                                    "Senior Center"
                                  ]);

                                  setState(() {});
                                },
                                child: Text("Add Hours"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  Future updateData(snap) async{
    DataSnapshot snapshot = snap.data.snapshot;

    print(snapshot.value);

    Map<dynamic, dynamic> rawData = snapshot.value;

    pendingEvents.clear();
    finishedEvents.clear();

    rawData.forEach((key, value){

      if(value["Status"] == "Pending"){
        pendingEvents = [value["Hours"]];
      } else if(value["Status"] == "Approved"){
        finishedEvents = [value["Hours"]];
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: reference.onValue,
      builder: (context, snap) {

        if(snap.hasData && snap.data.snapshot.value != null){
          updateData(snap);

        } else {
          pendingEvents.clear();
        }

        return MaterialApp(
          home: Scaffold(
            key: _scaffoldKey,
            drawer: _appConfigInstance.appDrawer(context),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 5,
              title: Text(
                'Your Events',
                style: TextStyle(color: Colors.green.shade200),
              ),
            ),
            body: Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Active Events",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: 400,
                      width: 400,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: enrolleddata.length,
                          itemBuilder: (context, int index) {
                            return Column(
                              children: <Widget>[
                                Container(
                                    height: 170,
                                    width: 370,
                                    decoration: BoxDecoration(
                                        color: Colors.green.shade300,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2),
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 20,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              enrolleddata[index][0],
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              enrolleddata[index][1],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: OutlineButton(
                                              textColor: Colors.white,
                                              child: Text(
                                                "Add Hours",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              splashColor: Colors.grey,
                                              onPressed: () {
                                                showAddHours(context);
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            );
                          }),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Finished Events",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width - 40,
                    child: ListView.builder(
                        itemCount: finishedEvents.length,
                        itemBuilder: (context, int index) {
                          return Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 70,
                                width: 370,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 7)
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 20),
                                              child: Text(
                                                "Senior Center",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 5, left: 10),
                                              child: Text(
                                                "1 Hours Approved",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Pending Events",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 40,
                    child: ListView.builder(
                        itemCount: pendingEvents.length,
                        itemBuilder: (context, int index) {
                          return Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 70,
                                width: 370,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 7)
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 20),
                                              child: Text(
                                                "Senior Center",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 5, left: 5),
                                              child: Text(
                                                pendingEvents[index][0].toString() + " Hour Pending",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.access_time,
                                        color: Colors.blue[600],
                                        size: 40,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
