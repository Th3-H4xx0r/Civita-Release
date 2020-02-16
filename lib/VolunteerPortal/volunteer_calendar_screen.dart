import 'package:civita/appconfig.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';


class VolunteerCalendarScreen extends StatefulWidget {
  @override
  VolunteerCalendarScreenState createState() => VolunteerCalendarScreenState();
}

class VolunteerCalendarScreenState extends State<VolunteerCalendarScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static var _appConfigInstance = AppConfig();

  var _mainFont = _appConfigInstance.mainProgramFont;


  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }



  //Global Variables
  static DateTime todayDate = DateTime.now();
  var selectedDay = DateFormat('MM/dd/yy').format(todayDate);

  void changeSelectedDate(DateTime dateTime){
    selectedDay = DateFormat('MM/dd/yy').format(dateTime);
    setState(() {

    });
  }

  List schedualData = [
    [
      "Senior Center",
      "02/16/20",
      "Help out with small tasks"
          ""
    ],

    [
      "Senior Center",
      "02/16/20",
      "Help out with small tasks"
          ""
    ],
    [
      "Central Park",
      "02/17/20",
      "Help out with small tasks"
          ""
    ],
    [
      "MHHS",
      "02/18/20",
      "Help out with cleaing tasks"
          ""
    ],
    [
      "MHHS",
      "02/16/20",
      "Help out special ed"
          ""
    ],

    [
      "MHHS",
      "02/17/20",
      "Help Clear Senior Center"
          ""
    ],

    [
      "MHHS",
      "02/17/20",
      "Help out with cleaing tasks"
          ""
    ],
    [
      "MHHS",
      "02/18/20",
      "Brainstorm City Ideas"
          ""
    ],
    [
      "MHHS",
      "02/19/20",
      "Help out The City of Pleasonton to \n organize a database of vast cultural \nactivities"
          ""
    ],


  ];

  @override
  Widget build(BuildContext context) {
    print(selectedDay);
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        drawer: _appConfigInstance.appDrawer(context),
        appBar: AppBar(
          backgroundColor: Colors.green.shade300,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title: Text("Upcomming events"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 273,
                color: Colors.green.shade300,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 20,
                        ),

                        Container(
                          width: 10,
                        ),

                        Center(
                          child: SizedBox(
                            height: 240,
                            width: 350,

                            child: Container(

                              height: 270,
                              width: 260,

                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade100),

                              child: TableCalendar(calendarController: _controller,
                                initialCalendarFormat: CalendarFormat.week,
                                calendarStyle: CalendarStyle(todayColor: Colors.purple.shade300, selectedColor: Colors.green.shade800),
                                onDaySelected: (day, list){
                                  changeSelectedDate(day);
                                  print(selectedDay);
                                  print(day);
                                  print(list);
                                },

                              ),


                            ),),
                        )


                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 15,
              ),
              Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: schedualData.length,
                    itemBuilder: (context, int index) {
                    print(index);
                    print("SELECTED DATE: " + schedualData[index][1]);
                    print("SELECTED DATE1: " + selectedDay);
                    if(selectedDay == schedualData[index][1]){
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                              ),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                            BorderRadius.circular(360),
                                            border: Border.all(
                                                color: Colors.deepPurple)),
                                      ),
                                      Container(width: 10),
                                      Padding(
                                        padding: EdgeInsets.only(right: 260),
                                        child: Text(
                                          schedualData[index][1],
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Container(
                                          height: 130,
                                          child: VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                      ),
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Container(height: 30,),
                                            Row(
                                              children: <Widget>[
                                                Container(width: 10,),
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    schedualData[index][0],
                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(height: 25,),
                                            Row(
                                              children: <Widget>[

                                                SizedBox(
                                                  width: 10,
                                                ),

                                                Text(
                                                    schedualData[index][2]
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        height: 120,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(height: 20,)
                        ],

                      );
                    } else {
                      return Container();
                    }

                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}