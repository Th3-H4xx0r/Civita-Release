import 'package:civita/appconfig.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static var _appConfigInstance = AppConfig();

  @override
  Widget build(BuildContext context) {
    Widget _BuildAppBar() {
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
          'Your Profile',
          style: TextStyle(fontSize: 24, color: Colors.green.shade300),
        ),
      );
    }

    final PreferredSizeWidget appBar = _BuildAppBar();

    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar,
      drawer: _appConfigInstance.appDrawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Container(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Container(
                      //picture in circle
                      width: 121,
                      height: 121,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsg6KXHm6o4SYhPycSwdsJnlGOWCVyIhWBWcg5y8_pki6coDzG'),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Susan Doe',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: (MediaQuery.of(context).size.width) - 100,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: <Widget>[
                            Text('15',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.blue.shade400)),
                            SizedBox(height: 5),
                            Text('Hours',
                                style:
                                TextStyle(fontSize: 18, color: Colors.grey))
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Text('40',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.yellow.shade600)),
                            SizedBox(height: 5),
                            Text('Goal',
                                style:
                                TextStyle(fontSize: 18, color: Colors.grey))
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Text('5',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.purple.shade400)),
                            SizedBox(height: 5),
                            Text('Events',
                                style:
                                TextStyle(fontSize: 18, color: Colors.grey))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: (MediaQuery.of(context).size.width) - 100,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Text(
              'Bio and Skills : ',
              style: TextStyle(fontSize: 26),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
                0.4,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    'Empowering my team each day to do the best work they can do is my passion. In every role I’ve taken in my career, I’ve brought a detail oriented, productive, growth mindset to my team. Making business decisions to positively impact employees, customers, suppliers and the bottom line motivates me.\n \n My experience is diverse- giving me a variety of sources to draw inspiration for creative solutions. In every endeavor, I find a way to learn, grow, adapt and excel.\n \n My approach is collaborative. Im comfortable working in and leading cross-functional teams to drive large and small change. My current focus is on digital transformation, data governance and automation to unlock productivity and positively impact employee satisfaction. ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}