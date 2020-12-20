import 'package:flutter/material.dart';
import 'package:meetingplanner/main.dart';
import 'package:meetingplanner/meetingsmodel.dart';

class Meetingdetail extends StatelessWidget {

  // final Meetings e;
  // Meetingdetail({this.e});
//   @override
//   MeetingdetailState createState() => MeetingdetailState();
// }

// class MeetingdetailState extends State<Meetingdetail> {

  // @override
  // void initState() {
  //   super.initState();
   
    
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
           new IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          dbHelper.delete(meetingStore.selectedmeeting.id);
                          Navigator.of(context).pop(true);
                        },
                      )
                    ],
                 
    
         title: Text("Meeting Details"),
      ),
      body: SingleChildScrollView(
        child :Padding(
                padding: const EdgeInsets.all(16.0),
                child: 
                // Expanded(
                //                   child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Expanded(child: Text('Title  : ${meetingStore.selectedmeeting.title}'))),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Expanded(child: new Text('Description : ${meetingStore.selectedmeeting.description}')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Expanded(child: new Text('Room : ${meetingStore.selectedmeeting.room}')),
                          ),
                          Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: new Text('Date :${meetingStore.selectedmeeting.date}'),
                            ),
                            new Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: new Text(
                                  'Time : ${meetingStore.selectedmeeting.starttime} - ${meetingStore.selectedmeeting.endtime}'),
                            ),
                          ]),
                          new Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Expanded(child: Text('Priority  : ${meetingStore.selectedmeeting.priority}'))),
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
      ));
}
}