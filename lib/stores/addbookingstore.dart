import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'addbookingstore.g.dart';

class AddBookingStore = _AddBookingStore with _$AddBookingStore;

abstract class _AddBookingStore with Store {
  @observable
  String selectPriority = "Priority";

  @observable
  String selectRoom = "Meeting Room";

  @observable
  String selectRemainder = "Remainder";

  @observable
  String durationTime = "";

  @observable
  DateTime pickedDate;

  @observable
  TimeOfDay time;

  @observable
  TimeOfDay totime;

  @action
  updateProirity(String prority) async {
    selectPriority = prority;
  }

  @action
  updateRoom(String room) async {
    selectRoom = room;
  }

  @action
  updateRemainder(String remainder) async {
    selectRemainder = remainder;
  }

  @action
  updateDuration(double hour, double minutes) async {
    if (hour > 0) {
      durationTime = "$hour Hour $minutes min";
    } else {
      durationTime = "$minutes min";
    }
  }
  

  @action
  bookinginitialSetup() async {
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
    //totime = TimeOfDay.now();
    if (time.minute > 29)
    {
    totime = TimeOfDay.now();
    }
    else
    {
      totime = time.replacing(hour: time.hour, minute: time.minute + 30);
    }
      timeDuration();
  }

  @action
  pickDate(BuildContext context) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2100),
      initialDate: pickedDate,
    );
    if (date != null) pickedDate = date;
  }

  @action
  pickTime(BuildContext context) async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null) time = t;
     timeDuration();
  }

  @action
  pickToTime(BuildContext context) async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: totime);
    if (t != null) totime = t;

    timeDuration();
  }

  @action
  timeDuration() {
    double _doubleYourTime =
        time.hour.toDouble() + (time.minute.toDouble() / 60);
    double _doubleNowTime =
        totime.hour.toDouble() + (totime.minute.toDouble() / 60);

    double _timeDiff =  _doubleNowTime - _doubleYourTime;

    double _hr = _timeDiff.truncateToDouble();
    double _minute = (_timeDiff - _timeDiff.truncate()) * 60;

    print('Here your Happy $_hr Hour and also ${_minute.roundToDouble()} min');
    updateDuration(_hr, _minute.roundToDouble());
  }
}
