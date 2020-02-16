import 'package:civita/appconfig.dart';
import 'package:flutter/material.dart';

class PendingRequest extends StatelessWidget {

  var hours = "";

  PendingRequest(String Phours){
    hours = Phours;
  }

  var appConfigInstance = AppConfig();


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.green,
        ),
        title: Text('Shabd Veyyakula', style: TextStyle(fontFamily: 'Comfortaa'),),
        subtitle: Text('$hours Hours', style: TextStyle(fontFamily: 'Comfortaa'),),
        trailing: Container(
          width: 200,
          child: Row(
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.check),
                onPressed: () {
                  appConfigInstance.approveRequest();
                },
              ),
              SizedBox(
                width: 5,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.delete),
                onPressed: () {
                  appConfigInstance.rejectRequest();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}