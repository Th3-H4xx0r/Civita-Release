import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String imageUrl;
  final int hoursCompleted;
  final int hoursTotal;

  ChartBar(this.imageUrl, this.hoursCompleted, this.hoursTotal);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 40,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 20,
                          width: (MediaQuery.of(context).size.width) - 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: <Widget>[
                              FractionallySizedBox(
                                widthFactor: (hoursCompleted / hoursTotal),
                                //will be chores completed / total chores across the board
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(119, 221, 119, 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: (hoursCompleted / hoursTotal) * 300 + 45,
                //percent of space filled by FractionallySizedBox * maxwidth of container(300) plus fourty (to make it look nice)
                //convert widthfactor on FractionallySizedBox to width of container
                height: 55,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      //this container acts like a circle avatar - how you fit a picture inside of a circle
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(imageUrl),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) - 40,
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}