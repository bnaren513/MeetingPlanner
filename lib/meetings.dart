import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meetingplanner/addbooking.dart';
import 'package:meetingplanner/constants.dart';
import 'package:meetingplanner/dbhelper.dart';
import 'package:meetingplanner/main.dart';
import 'package:meetingplanner/meetingdetail.dart';
import 'package:meetingplanner/meetingsmodel.dart';

class MeetingsList extends StatefulWidget {
  @override
  MeetingsListState createState() => MeetingsListState();
}

class MeetingsListState extends State<MeetingsList> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();

    meetingStore.refreshList();
  }

 

  list() {
    return Expanded(
      child: FutureBuilder(
        future: meetingStore.meetings,
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data.length == 0) {
            return Center(child: Text("No Data Found"));
          }
          if (snapshot.data.length != 0) {
            return dataLoadtable(snapshot.data);
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  dataLoadtable(List<Meetings> employees) {
    return new ListView.builder(
        itemCount: employees.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext ctxt, int index) {
          Meetings e = employees[index];
          return GestureDetector(
            onTap: () {
              meetingStore.meetingSelection(e);
              Navigator.of(context)
                  .pushNamed(Constants.ROUTE_MEETINGDETAIL)
                  .then((results) {
                if (results) {
                  meetingStore.refreshList();
                }
              });
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    // Expanded(
                    //                   child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      new Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Expanded(child: Text(e.title))),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Expanded(child: new Text(e.description)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Expanded(child: new Text('Room : ${e.room}')),
                      ),
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: new Text('Date :${e.date}'),
                        ),
                        new Padding(
                          padding: const EdgeInsets.all(2.0),
                          child:
                              new Text('Time : ${e.starttime} - ${e.endtime}'),
                        ),
                      ])
                    ]),
                //   new IconButton(
                //     icon: Icon(Icons.delete),
                //     onPressed: () {
                //       dbHelper.delete(e.id);
                //       refreshList();
                //     },
                //   )
                // ]),
                // )
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(Constants.ROUTE_ADDBOOKING)
                  .then((results) {
                meetingStore.refreshList();
              });
            },
          )
        ],
        title: new Text('Meetings'),
      ),
      body: Observer(builder: (_) {
        return new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              list(),
            ],
          ),
        );
      }),
    );
  }
}
