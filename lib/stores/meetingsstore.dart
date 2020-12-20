import 'package:flutter/material.dart';
import 'package:meetingplanner/main.dart';
import 'package:meetingplanner/meetingsmodel.dart';
import 'package:mobx/mobx.dart';

part 'meetingsstore.g.dart';

class MeetingsStore = _MeetingsStore with _$MeetingsStore;

abstract class _MeetingsStore with Store {
  @observable
  Future<List<Meetings>> meetings;

  @observable
  Meetings selectedmeeting;

  @action
  refreshList() {
    meetings = dbHelper.getMeetings();
  }

  @action
  meetingSelection(Meetings meeting) {
    selectedmeeting = meeting;
  }
}
