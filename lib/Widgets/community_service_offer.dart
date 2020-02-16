import 'package:civita/VolunteerPortal/eventinfoscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommunityServiceOffer extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String timeOfEvent;
  final DateTime dateOfEvent;
  final String provider;

  CommunityServiceOffer({
    this.title,
    this.imageUrl,
    this.timeOfEvent,
    this.dateOfEvent,
    this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => EventInfoScreen(this.title, DateFormat.yMMMd().format(dateOfEvent))));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    // BoxFit.cover resizes and crops the image so that it fits nicely into the container
                  ),
                  // Image.network creates an image widget that reaches out to the network to fetch the image
                ),
                //ClipRRect takes a child and forces that child into a certain form - ex. child is an image that is forced to have rounded corner          ],
                Positioned(
                  // allows you to position the child widget in an absolute coordinate space - really only works with stack
                  bottom: 20,
                  right: 10,
                  // text is 20 pixels up from the bottom and 20 pixels in from the right
                  child: Container(
                    width: 400,
                    color: Colors.white,
                    // makes sure that text can be read even with bright colors
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.green.shade300,
                      ),
                      softWrap: true,
                      // softWrap: true - if the text is too long for the container - it is wrapped
                      overflow: TextOverflow.fade,
                      // text fades out if the text overflows out of the box
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // empty space in the row is split up evenly
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text(timeOfEvent),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.date_range),
                      SizedBox(width: 6),
                      Text(
                        DateFormat.yMMMd().format(dateOfEvent),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.person),
                      SizedBox(width: 6),
                      Text(provider),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}