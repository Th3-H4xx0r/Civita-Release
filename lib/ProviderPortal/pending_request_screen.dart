
import 'package:civita/Widgets/pending_request.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PendingRequestsScreen extends StatefulWidget {
  PendingRequestsScreenState createState() => PendingRequestsScreenState();
}

class PendingRequestsScreenState extends State<PendingRequestsScreen> {
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  var pendingList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.more_vert),
        ),
        title: Text(
          'Pending Requests',
          style: TextStyle(fontSize: 24, color: Colors.green.shade300, fontFamily: 'Comfortaa'),
        ),
      ),
      body: StreamBuilder(
        stream: databaseReference.onValue,
        builder: (context, snap) {
          if (snap.hasData && snap.data.snapshot.value != null) {
            Map<dynamic, dynamic> rawData = snap.data.snapshot.value;

            pendingList.clear();

            rawData.forEach((key, value) {
              pendingList = [value["Hours"]];
            });

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 18),
                  child: Text(
                    pendingList.length.toString() + ' new request pending',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey.shade800,
                        fontFamily: 'Comfortaa'
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 400,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                      itemCount: pendingList.length,
                      itemBuilder: (context, int index1) {
                        return Container(
                          height: 120,
                          width: 100,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: <Widget>[
                              PendingRequest(pendingList[index1][0]),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
// card with accept or decline
//plofile pic
//number of hours that person has
