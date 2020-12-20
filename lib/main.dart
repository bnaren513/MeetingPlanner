import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meetingplanner/addbooking.dart';
import 'package:meetingplanner/constants.dart';
import 'package:meetingplanner/meetingdetail.dart';
import 'package:meetingplanner/meetings.dart';
import 'package:meetingplanner/meetingsmodel.dart';
import 'package:meetingplanner/stores/addbookingstore.dart';
import 'package:meetingplanner/stores/meetingsstore.dart';

var dbHelper;
final AddBookingStore bookingStore = AddBookingStore();
final MeetingsStore meetingStore = MeetingsStore();

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MeetingsList(),
      routes: 
      {
      //All Screen routes must be defined here
              Constants.ROUTE_MEETINGS: (BuildContext context) => MeetingsList(),
              Constants.ROUTE_ADDBOOKING: (BuildContext context) => AddBooking(),
              Constants.ROUTE_MEETINGDETAIL: (BuildContext context) => Meetingdetail(),
      
       },
        onUnknownRoute: (RouteSettings setting) {
              // String unknownRoute = setting.name ;
              return MaterialPageRoute(
                  builder: (BuildContext context) => MeetingsList());
            });
      
      //MyHomePage(title: 'Flutter Demo Home Page'),
    
  }
}

