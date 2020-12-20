
class Meetings {
  int id;
  //String name;
  String title;
  String description;
  String date;
  String starttime;
  String endtime;
  String duration;
  String room;
  String remainder;
  String priority;
 
  Meetings(this.id, this.title,this.description,this.date,this.starttime,this.endtime,this.duration,this.room,this.remainder,this.priority);
 
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'description':description,
      'date': date,
      'starttime': starttime,
      'endtime': endtime,
      'remainder' : remainder,
      'duration' : duration,
      'room' :room,
      'priority' : priority
    };
    return map;
  }
 
  Meetings.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
     description = map['description'];
      date = map['date'];
       starttime = map['starttime'];
        endtime = map['endtime'];
         remainder = map['remainder'];
       duration = map['duration'];
        room = map['room'];
    priority = map['priority'];
  }
}