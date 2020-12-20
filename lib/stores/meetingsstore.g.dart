// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meetingsstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MeetingsStore on _MeetingsStore, Store {
  final _$meetingsAtom = Atom(name: '_MeetingsStore.meetings');

  @override
  Future<List<Meetings>> get meetings {
    _$meetingsAtom.reportRead();
    return super.meetings;
  }

  @override
  set meetings(Future<List<Meetings>> value) {
    _$meetingsAtom.reportWrite(value, super.meetings, () {
      super.meetings = value;
    });
  }

  final _$selectedmeetingAtom = Atom(name: '_MeetingsStore.selectedmeeting');

  @override
  Meetings get selectedmeeting {
    _$selectedmeetingAtom.reportRead();
    return super.selectedmeeting;
  }

  @override
  set selectedmeeting(Meetings value) {
    _$selectedmeetingAtom.reportWrite(value, super.selectedmeeting, () {
      super.selectedmeeting = value;
    });
  }

  final _$_MeetingsStoreActionController =
      ActionController(name: '_MeetingsStore');

  @override
  dynamic refreshList() {
    final _$actionInfo = _$_MeetingsStoreActionController.startAction(
        name: '_MeetingsStore.refreshList');
    try {
      return super.refreshList();
    } finally {
      _$_MeetingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic meetingSelection(Meetings meeting) {
    final _$actionInfo = _$_MeetingsStoreActionController.startAction(
        name: '_MeetingsStore.meetingSelection');
    try {
      return super.meetingSelection(meeting);
    } finally {
      _$_MeetingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
meetings: ${meetings},
selectedmeeting: ${selectedmeeting}
    ''';
  }
}
