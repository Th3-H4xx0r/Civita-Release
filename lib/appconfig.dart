import 'package:civita/VolunteerPortal/eventinfoscreen.dart';
import 'package:civita/VolunteerPortal/volunteer_manage_events.dart';
import 'package:civita/VolunteerPortal/volunteer_profile_page.dart';
import 'package:civita/VolunteerPortal/volunteerhomepage.dart';
import 'package:civita/VolunteerPortal/volunteer_calendar_screen.dart';
import 'package:civita/loginpage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AppConfig {
  var mainProgramFont = "Comfortaa";

  Widget appDrawer(context){
    return Drawer(
      elevation: 20,
      child: Column(
        children: <Widget>[

          SizedBox(
            height: 50,
          ),

          InkWell(
            child: new ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: new Text("user@gmail.com"),
              trailing: Icon(Icons.settings),
            ),
            splashColor: Colors.grey,
          ),
          Divider(
            thickness: 2,

          ),


          Container(
            height: 10,
          ),

          InkWell(
            child: new ListTile(
              title: new Text("Home"),
              trailing: Icon(Icons.home, color: Colors.green.shade200),
            ),
            splashColor: Colors.grey,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),

          Container(
            height: 10,
          ),

          InkWell(
            child: new ListTile(
              title: new Text("My Events"),
              trailing: Icon(Icons.event, color: Colors.green.shade200),
            ),
            splashColor: Colors.grey,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ManageEvents()));
            },
          ),

          Container(
            height: 10,
          ),

          InkWell(
            child: new ListTile(
              title: new Text("Calendar"),
              trailing: Icon(Icons.calendar_today, color: Colors.green.shade200),
            ),
            splashColor: Colors.grey,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => VolunteerCalendarScreen()));
            },
          ),


          Container(
            height: 10,
          ),

          InkWell(
            child: new ListTile(
              title: new Text("Profile"),
              trailing: Icon(Icons.person, color: Colors.green.shade200),
            ),
            splashColor: Colors.grey,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen()));
            },
          ),


          Expanded(
            child: Container(),
          ),

          InkWell(
            child: new ListTile(
              dense: true,
              selected: false,
              title: new Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.red,
              ),
            ),
            splashColor: Colors.grey,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              //userManagementInstance.logout(context);

            },
          ),

        ],
      ),
    );
  }


  Future updateHours(String startTime, String endTime, String description) async{
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("Request1");

    databaseReference.child("Start Time").set(startTime);

    databaseReference.child("End Time").set(endTime);

    databaseReference.child("Description").set(description);

    databaseReference.child("Status").set("Pending");

    databaseReference.child("Hours").set("1");

  }

  Future rejectRequest() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("Request1");

    databaseReference.child("Status").set("Declined");
  }

  Future approveRequest() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("Request1");

    databaseReference.child("Status").set("Approved");
  }
}