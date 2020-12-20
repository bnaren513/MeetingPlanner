import 'dart:async';
import 'dart:io' as io;
import 'package:meetingplanner/meetingsmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

 
class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String TITLE = 'title';
  static const String DESCRIPTION = 'description';
  static const String DATE = 'date';
  static const String STARTIME = 'starttime';
  static const String ENDTIME = 'endtime';
  static const String DURATION = 'duration';
  static const String REMAINDER = 'remainder';
  static const String ROOM = 'room';
  static const String PRIORITY = 'priority';
  static const String TABLE = 'Meetings';
  static const String DB_NAME = 'meetings.db';
 
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }
 
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
 
  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $TITLE TEXT, $DESCRIPTION TEXT , $DATE TEXT , $STARTIME TEXT , $ENDTIME TEXT ,$DURATION TEXT , $REMAINDER TEXT , $ROOM  TEXT , $PRIORITY TEXT)");
  }
 
  Future<Meetings> save(Meetings meeting) async {
    var dbClient = await db;
    meeting.id = await dbClient.insert(TABLE, meeting.toMap());

    return meeting;
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }
  Future<List<Meetings>> getMeetings() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, TITLE,DESCRIPTION,DATE,STARTIME,ENDTIME,DURATION,REMAINDER,ROOM,PRIORITY]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Meetings> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(Meetings.fromMap(maps[i]));
      }
    }
    return employees;
  }
  
 
  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }
 
  Future<int> update(Meetings employee) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, employee.toMap(),
        where: '$ID = ?', whereArgs: [employee.id]);
  }
 
  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}