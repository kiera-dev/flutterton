import 'dart:ui';
import 'package:flutter/material.dart';
import 'bigquery.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class WorkoutCard extends StatelessWidget {
  var numWorkouts;
  var milesRidden;
  var minutes;
  var calories;
  var speed;
  var cardType;
  Map<String, String> cardTypes = {
    'today': "Today's Data",
    "yesterday": "Yesterday's Data",
    "this_month": "This Month's Data",
    "last_month": "Last Month's Data",
    "this_year": "This Year's Data",
  };

  WorkoutCard(numWorkouts, milesRidden, minutes, calories, speed, cardType) {
    this.numWorkouts = numWorkouts;
    this.milesRidden = milesRidden;
    this.minutes = minutes;
    this.calories = calories;
    this.speed = speed;
    this.cardType = cardTypes[cardType];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
      color: Colors.blueGrey[50],
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          constraints: BoxConstraints(minHeight: 150, minWidth: 250),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 10, 20),
                        child: Text(this.cardType,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.directions_bike_outlined,
                              color: Colors.black),
                          Text('Distance:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.milesRidden.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.query_builder_outlined,
                              color: Colors.black),
                          Text('Time:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.minutes.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.speed_outlined, color: Colors.black),
                          Text('Average Speed:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.speed.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_fire_department,
                              color: Colors.black),
                          Text('Calories Burned:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.calories.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }
}

class MyApp extends StatelessWidget {
  final workoutFuture = getWorkoutData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Dashboard',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Workout Dashboard'),
          backgroundColor: Colors.grey[850],
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.orange[800], Colors.pink[900]])),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder(
                          future: workoutFuture,
                          builder: (context, AsyncSnapshot<Map> snapshot) {
                            if (snapshot.hasData) {
                              var workoutData = snapshot.data;
                              List<Widget> workoutCards = [];
                              workoutData.forEach((key, value) {
                                var workoutCard = WorkoutCard(
                                  value['num_workouts'],
                                  value['miles_ridden'],
                                  value['minutes_ridden'],
                                  value['calories_burned'],
                                  value['average_speed'],
                                  key,
                                );
                                workoutCards.add(workoutCard);
                              });
                              workoutCards.add(Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20)));
                              return SingleChildScrollView(
                                child: Column(
                                  children: workoutCards,
                                ),
                              );
                            }
                            if (snapshot.hasError) {
                              return Text('poop');
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
