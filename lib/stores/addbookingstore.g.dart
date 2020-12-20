// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addbookingstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddBookingStore on _AddBookingStore, Store {
  final _$selectPriorityAtom = Atom(name: '_AddBookingStore.selectPriority');

  @override
  String get selectPriority {
    _$selectPriorityAtom.reportRead();
    return super.selectPriority;
  }

  @override
  set selectPriority(String value) {
    _$selectPriorityAtom.reportWrite(value, super.selectPriority, () {
      super.selectPriority = value;
    });
  }

  final _$selectRoomAtom = Atom(name: '_AddBookingStore.selectRoom');

  @override
  String get selectRoom {
    _$selectRoomAtom.reportRead();
    return super.selectRoom;
  }

  @override
  set selectRoom(String value) {
    _$selectRoomAtom.reportWrite(value, super.selectRoom, () {
      super.selectRoom = value;
    });
  }

  final _$selectRemainderAtom = Atom(name: '_AddBookingStore.selectRemainder');

  @override
  String get selectRemainder {
    _$selectRemainderAtom.reportRead();
    return super.selectRemainder;
  }

  @override
  set selectRemainder(String value) {
    _$selectRemainderAtom.reportWrite(value, super.selectRemainder, () {
      super.selectRemainder = value;
    });
  }

  final _$durationTimeAtom = Atom(name: '_AddBookingStore.durationTime');

  @override
  String get durationTime {
    _$durationTimeAtom.reportRead();
    return super.durationTime;
  }

  @override
  set durationTime(String value) {
    _$durationTimeAtom.reportWrite(value, super.durationTime, () {
      super.durationTime = value;
    });
  }

  final _$pickedDateAtom = Atom(name: '_AddBookingStore.pickedDate');

  @override
  DateTime get pickedDate {
    _$pickedDateAtom.reportRead();
    return super.pickedDate;
  }

  @override
  set pickedDate(DateTime value) {
    _$pickedDateAtom.reportWrite(value, super.pickedDate, () {
      super.pickedDate = value;
    });
  }

  final _$timeAtom = Atom(name: '_AddBookingStore.time');

  @override
  TimeOfDay get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(TimeOfDay value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  final _$totimeAtom = Atom(name: '_AddBookingStore.totime');

  @override
  TimeOfDay get totime {
    _$totimeAtom.reportRead();
    return super.totime;
  }

  @override
  set totime(TimeOfDay value) {
    _$totimeAtom.reportWrite(value, super.totime, () {
      super.totime = value;
    });
  }

  final _$updateProirityAsyncAction =
      AsyncAction('_AddBookingStore.updateProirity');

  @override
  Future updateProirity(String prority) {
    return _$updateProirityAsyncAction.run(() => super.updateProirity(prority));
  }

  final _$updateRoomAsyncAction = AsyncAction('_AddBookingStore.updateRoom');

  @override
  Future updateRoom(String room) {
    return _$updateRoomAsyncAction.run(() => super.updateRoom(room));
  }

  final _$updateRemainderAsyncAction =
      AsyncAction('_AddBookingStore.updateRemainder');

  @override
  Future updateRemainder(String remainder) {
    return _$updateRemainderAsyncAction
        .run(() => super.updateRemainder(remainder));
  }

  final _$updateDurationAsyncAction =
      AsyncAction('_AddBookingStore.updateDuration');

  @override
  Future updateDuration(double hour, double minutes) {
    return _$updateDurationAsyncAction
        .run(() => super.updateDuration(hour, minutes));
  }

  final _$bookinginitialSetupAsyncAction =
      AsyncAction('_AddBookingStore.bookinginitialSetup');

  @override
  Future bookinginitialSetup() {
    return _$bookinginitialSetupAsyncAction
        .run(() => super.bookinginitialSetup());
  }

  final _$pickDateAsyncAction = AsyncAction('_AddBookingStore.pickDate');

  @override
  Future pickDate(BuildContext context) {
    return _$pickDateAsyncAction.run(() => super.pickDate(context));
  }

  final _$pickTimeAsyncAction = AsyncAction('_AddBookingStore.pickTime');

  @override
  Future pickTime(BuildContext context) {
    return _$pickTimeAsyncAction.run(() => super.pickTime(context));
  }

  final _$pickToTimeAsyncAction = AsyncAction('_AddBookingStore.pickToTime');

  @override
  Future pickToTime(BuildContext context) {
    return _$pickToTimeAsyncAction.run(() => super.pickToTime(context));
  }

  final _$_AddBookingStoreActionController =
      ActionController(name: '_AddBookingStore');

  @override
  dynamic timeDuration() {
    final _$actionInfo = _$_AddBookingStoreActionController.startAction(
        name: '_AddBookingStore.timeDuration');
    try {
      return super.timeDuration();
    } finally {
      _$_AddBookingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectPriority: ${selectPriority},
selectRoom: ${selectRoom},
selectRemainder: ${selectRemainder},
durationTime: ${durationTime},
pickedDate: ${pickedDate},
time: ${time},
totime: ${totime}
    ''';
  }
}
