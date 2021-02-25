import 'package:flutter/material.dart';
import 'bigquery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final workoutData = getWorkoutData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Dashboard',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Workout Dashboard'),
          backgroundColor: Colors.grey[850],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.orange[800], Colors.pink[900]])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      // expand,flexible,mediaquery
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                      color: Colors.blueGrey[50],
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          constraints:
                              BoxConstraints(minHeight: 150, minWidth: 250),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 20, 10, 20),
                                        child: Text("Today's Data",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            )))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.directions_bike_outlined,
                                              color: Colors.black),
                                          Text('Distance:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.query_builder_outlined,
                                              color: Colors.black),
                                          Text('Time:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.speed_outlined,
                                              color: Colors.black),
                                          Text('Average Speed:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.local_fire_department,
                                              color: Colors.black),
                                          Text('Calories Burned:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      // expand,flexible,mediaquery
                      color: Colors.blueGrey[50],
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          constraints:
                              BoxConstraints(minHeight: 150, minWidth: 250),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 20, 10, 20),
                                        child: Text("Yesterday's Data",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            )))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.directions_bike_outlined,
                                              color: Colors.black),
                                          Text('Distance:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.query_builder_outlined,
                                              color: Colors.black),
                                          Text('Time:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.speed_outlined,
                                              color: Colors.black),
                                          Text('Average Speed:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.local_fire_department,
                                              color: Colors.black),
                                          Text('Calories Burned:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      // expand,flexible,mediaquery
                      color: Colors.blueGrey[50],
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          constraints:
                              BoxConstraints(minHeight: 150, minWidth: 250),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 20, 10, 20),
                                        child: Text("This Month's Data",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            )))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.directions_bike_outlined,
                                              color: Colors.black),
                                          Text('Distance:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.query_builder_outlined,
                                              color: Colors.black),
                                          Text('Time:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.speed_outlined,
                                              color: Colors.black),
                                          Text('Average Speed:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.local_fire_department,
                                              color: Colors.black),
                                          Text('Calories Burned:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.blueGrey[50],
                      // expand,flexible,mediaquery
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          constraints:
                              BoxConstraints(minHeight: 150, minWidth: 250),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 20, 10, 20),
                                        child: Text("Last Month's Data",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            )))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.directions_bike_outlined,
                                              color: Colors.black),
                                          Text('Distance:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.query_builder_outlined,
                                              color: Colors.black),
                                          Text('Time:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.speed_outlined,
                                              color: Colors.black),
                                          Text('Average Speed:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.local_fire_department,
                                              color: Colors.black),
                                          Text('Calories Burned:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.blueGrey[50],
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                      // expand,flexible,mediaquery
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          constraints:
                              BoxConstraints(minHeight: 150, minWidth: 250),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 20, 10, 20),
                                        child: Text("This Year's Data",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            )))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.directions_bike_outlined,
                                              color: Colors.black),
                                          Text('Distance:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.query_builder_outlined,
                                              color: Colors.black),
                                          Text('Time:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.speed_outlined,
                                              color: Colors.black),
                                          Text('Average Speed:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.local_fire_department,
                                              color: Colors.black),
                                          Text('Calories Burned:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('25 min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
