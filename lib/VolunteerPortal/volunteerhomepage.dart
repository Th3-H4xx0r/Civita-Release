import 'package:civita/VolunteerPortal/eventinfoscreen.dart';
import 'package:civita/appconfig.dart';
import 'package:civita/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../Widgets/chart_bar.dart';
import '../Widgets/community_service_offer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static var _appConfigInstance = AppConfig();

  var _mainFont = _appConfigInstance.mainProgramFont;
  @override
  Widget build(BuildContext context) {
    Widget _buildAppBar() {
      return AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black,),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },

        ),
        title: Text(
          'Dashboard',
          style: TextStyle(fontSize: 24, color: Colors.green.shade300, fontFamily: _mainFont),
        ),
      );
    }

    final PreferredSizeWidget appBar = _buildAppBar();

    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar,
      drawer: _appConfigInstance.appDrawer(context),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 5, left: 10),
                child: Text("Hours Completed - 20", style: TextStyle(fontSize: 20, fontFamily: _mainFont, color: Colors.grey[600]),),
              ),
            ],
          ),
          Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChartBar(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsg6KXHm6o4SYhPycSwdsJnlGOWCVyIhWBWcg5y8_pki6coDzG',
                  20,
                  40,),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 35,
            child: Padding(
              padding: const EdgeInsets.only(top: 12, left: 12),
              child: Text(
                'Community Service Offers',
                style: TextStyle(fontSize: 20, color: Colors.black54, fontFamily: _mainFont),
              ),
            ),
          ),

          SizedBox(
            height: 12,
          ),

          Container(
            height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
                0.79,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                CommunityServiceOffer(
                    title: 'Plant trees at Central Park',
                    imageUrl:
                    'https://www.niche.com/blog/wp-content/uploads/2019/01/importance-of-community-service-1200-1200x794.jpg',
                    timeOfEvent: '12:50 am',
                    dateOfEvent: DateTime.now(),
                    provider: 'Central Park',
                  ),

                CommunityServiceOffer(
                  title: 'Pick up trash around Plesanton',
                  imageUrl:
                  'https://blog.prepscholar.com/hs-fs/hubfs/feature_community.jpg?width=416&name=feature_community.jpg',
                  timeOfEvent: '1:50 pm',
                  dateOfEvent: DateTime.now(),
                  provider: 'MHHS',
                ),
                CommunityServiceOffer(
                  title: 'Hackathon Club Coding Workshop',
                  imageUrl:
                  'https://thumbs.dreamstime.com/b/isometric-flat-vector-concept-hackathon-hack-marathon-coding-event-app-software-development-153905945.jpg',
                  timeOfEvent: '9:50 am',
                  dateOfEvent: DateTime.now(),
                  provider: 'MHHS',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}