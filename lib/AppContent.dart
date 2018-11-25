import 'package:flutter/material.dart';
import 'package:senseless_app/Task.dart';
import 'package:senseless_app/TaskRow.dart';

class AppContent extends StatelessWidget {

  double _imageHeight = 256.0;
  AppContent(this._imageHeight);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: _imageHeight),
        child: Stack(
          children: <Widget>[

            _buildTimeline(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildMyTasksHeader(),
                //_buildTimeline(),
                _buildTasksList(),
              ],
            ),

          ],
        ),
      ),
    );

  }

  Widget _buildTimeline() {
    return Positioned(
      top: 80.0,
      bottom: 0.0,
      left: 32.0,
      child: Container(
        width: 1.0,
        color: Colors.grey[300],
      ),
    );
  }

  Widget _buildTasksList() {

    List<Task> tasks = [
      Task(
          name: "Wake up",
          category: "Main List",
          time: "7.00am",
          color: Colors.orange,
          completed: false),
      Task(
          name: "Take a coffee",
          category: "Main List",
          time: "7.05am",
          color: Colors.brown,
          completed: true),
      Task(
          name: "Go to university",
          category: "Main List",
          time: "8.00am",
          color: Colors.green,
          completed: false),
      Task(
          name: "Try to understand the prof",
          category: "Main List",
          time: "9.00am",
          color: Colors.red,
          completed: true),
      Task(
          name: "Take another coffee",
          category: "Main List",
          time: "11.00am",
          color: Colors.brown,
          completed: true),
      Task(
          name: "Nothing to do :(",
          category: "Dead list",
          time: "11.10am",
          color: Colors.black,
          completed: true),
    ];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 25,
        ),
        child: ListView(
          children: tasks.map((task) => TaskRow(task: task)).toList(),
        ),
      ),
    );
  }

  Widget _buildMyTasksHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'My tasks',
            style: TextStyle(fontSize: 34.0),
          ),
          Text(
            getToday() + ' ' + getDate(),
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
    );
  }

  String getDate() {
    var today = DateTime.now();
    String dateSlug ="${today.day.toString().padLeft(2,'0')}-${today.month.toString().padLeft(2,'0')}-${today.year.toString()}";
    return dateSlug;
  }

  String getToday() {

    const weekdays = [
      'Monday',
      'Tueasday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return weekdays[DateTime.now().weekday - 1];
  }

}
