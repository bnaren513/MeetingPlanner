import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meetingplanner/main.dart';
import 'package:meetingplanner/meetingsmodel.dart';

class AddBooking extends StatefulWidget {
  @override
  AddBookingState createState() => AddBookingState();
}

class AddBookingState extends State<AddBooking> {
  TextEditingController titlecontroller = TextEditingController(text: "");
  TextEditingController descriptioncontroller = TextEditingController(text: "");

  List<String> roomavailability = [
    'Meeting Room',
    'Room 1',
    'Room 2',
    'Room 3'
  ];

  List<String> priorities = ['Priority', 'Low', 'Medium', 'High'];

  List<String> remainders = ['Remainder', '15min', '30min', '24hrs'];

  @override
  void initState() {
    super.initState();

    bookingStore.bookinginitialSetup();
    bookingStore.updateProirity("Priority");
    bookingStore.updateRemainder("Remainder");
    bookingStore.updateRoom("Meeting Room");

    
  }
  bool addbookingValidations()
  {
    if (titlecontroller.text != "" && descriptioncontroller.text != "" && bookingStore.selectRoom != "Meeting Room" &&  bookingStore.selectPriority != "Priority" &&  bookingStore.selectRemainder != "Remainder")
    {
    return true;
    }
    else
    {
      
      alertDisplay("Please choose all required fields");
      return false;
    }
  }
  void alertDisplay(String text) {
  showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text("Meeting Planer"),
        content: new Text(text),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.black,
            child: Text("Ok"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        actions: <Widget>[
          FlatButton(
            child: Text('Add'),
            onPressed: () {
             if( addbookingValidations())
             {
              Meetings e = Meetings(
                  null,
                  titlecontroller.text,
                  descriptioncontroller.text,
                  "${bookingStore.pickedDate.year}, ${bookingStore.pickedDate.month}, ${bookingStore.pickedDate.day}",
                  "${bookingStore.time.hour}:${bookingStore.time.minute}",
                  "${bookingStore.totime.hour}:${bookingStore.totime.minute}",
                  "15",
                  bookingStore.selectRoom,
                  bookingStore.selectRemainder,
                  bookingStore.selectPriority);
              dbHelper.save(e);
              Navigator.of(context).pop(true);
             }
            },
          )
        ],
        title: Text("Add Booking"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Observer(builder: (_) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titlecontroller,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter title';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptioncontroller,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter description';
                    }

                    return null;
                  },
                ),
                ListTile(
                    title: Text(
                        "Date: ${bookingStore.pickedDate.year}, ${bookingStore.pickedDate.month}, ${bookingStore.pickedDate.day}"),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: () {
                      bookingStore.pickDate(context);
                    }),
                ListTile(
                  title: Text(
                      "Start Time: ${bookingStore.time.hour}:${bookingStore.time.minute}"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  onTap: () {
                    bookingStore.pickTime(context);
                  },
                ),
                ListTile(
                    title: Text(
                        "End Time: ${bookingStore.totime.hour}:${bookingStore.totime.minute}"),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: () {
                      bookingStore.pickToTime(context);
                    }),
                Text("Meeting Duration : ${bookingStore.durationTime}"),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: new DropdownButton<String>(
                          value: bookingStore.selectRoom,
                          items: roomavailability.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            if (newValue == "Meeting Room") {
                            } else {
                              bookingStore.updateRoom(newValue);
                            }
                          },
                        )),
                    new Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: new DropdownButton<String>(
                          value: bookingStore.selectPriority,
                          items: priorities.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            if (newValue == "Priority") {
                            } else {
                              bookingStore.updateProirity(newValue);
                            }
                          },
                        )),
                    new Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: new DropdownButton<String>(
                          value: bookingStore.selectRemainder,
                          items: remainders.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            if (newValue == "Remainder") {
                            } else {
                              bookingStore.updateRemainder(newValue);
                            }
                          },
                        )),
                  ],
                ),
              ]);
        }),
      ),
    );
  }
}
