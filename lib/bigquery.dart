import 'package:googleapis/bigquery/v2.dart';
import 'package:googleapis_auth/auth_io.dart';

// BigQuery Dart library: https://github.com/dart-lang/googleapis/blob/master/generated/googleapis/lib/bigquery/v2.dart

// For local development, pass your service account credentials via GOOGLE_APPLICATION_CREDENTIALS
//    export FLUTTERTON_KEY=`tr -d '' < $GOOGLE_APPLICATION_CREDENTIALS`
//    flutter run -d chrome --dart-define=key=$FLUTTERTON_KEY

// Populate this with your service account key when building releases.
var serviceAccountJson = r'''   
''';

const _SCOPES = const [
  'https://www.googleapis.com/auth/userinfo.profile',
  'https://www.googleapis.com/auth/cloud-platform.read-only',
];

const TODAY_SQL = '''
  SELECT 
    COUNT(*) AS num_workouts,
    ROUND(SUM(distance),2) AS miles_ridden,
    ROUND(SUM(duration),2) AS minutes_ridden,
    ROUND(SUM(calories),2) AS calories_burned,
    ROUND(AVG(speed),2) AS average_speed,
  FROM 
    `peloton-dashboard.peloton.workouts_pretty`
  WHERE 
    DATETIME_DIFF(CURRENT_DATETIME("America/Los_Angeles"), date_time, DAY) = 0;
''';

const YESTERDAY_SQL = '''
  SELECT 
    COUNT(*) AS num_workouts,
    ROUND(SUM(distance),2) AS miles_ridden,
    ROUND(SUM(duration),2) AS minutes_ridden,
    ROUND(SUM(calories),2) AS calories_burned,
    ROUND(AVG(speed),2) AS average_speed,
  FROM 
    `peloton-dashboard.peloton.workouts_pretty`
  WHERE 
    DATETIME_DIFF(CURRENT_DATETIME("America/Los_Angeles"), date_time, DAY) = 1;
''';

const THIS_MONTH_SQL = '''
  SELECT 
    COUNT(*) AS num_workouts,
    ROUND(SUM(distance),2) AS miles_ridden,
    ROUND(SUM(duration),2) AS minutes_ridden,
    ROUND(SUM(calories),2) AS calories_burned,
    Round(AVG(speed),2) AS average_speed,
  FROM 
    `peloton-dashboard.peloton.workouts_pretty`
  WHERE 
    DATETIME_DIFF(CURRENT_DATETIME("America/Los_Angeles"), date_time, MONTH) = 0;
''';

const LAST_MONTH_SQL = '''
  SELECT 
    COUNT(*) AS num_workouts,
    ROUND(SUM(distance),2) AS miles_ridden,
    ROUND(SUM(duration),2) AS minutes_ridden,
    ROUND(SUM(calories),2) AS calories_burned,
    ROUND(AVG(speed),2) AS average_speed,
  FROM 
    `peloton-dashboard.peloton.workouts_pretty`
  WHERE 
    DATETIME_DIFF(CURRENT_DATETIME("America/Los_Angeles"), date_time, MONTH) = 1;
''';

const THIS_YEAR_SQL = '''
  SELECT 
    COUNT(*) AS num_workouts,
    ROUND(SUM(distance),2) AS miles_ridden,
    ROUND(SUM(duration),2) AS minutes_ridden,
    ROUND(SUM(calories),2) AS calories_burned,
    ROUND(AVG(speed),2) AS average_speed,
  FROM 
    `peloton-dashboard.peloton.workouts_pretty`
  WHERE 
    DATETIME_DIFF(CURRENT_DATETIME("America/Los_Angeles"), date_time, YEAR) = 0;
''';

final workoutQueries = <String, String>{
  'today': TODAY_SQL,
  'yesterday': YESTERDAY_SQL,
  'this_month': THIS_MONTH_SQL,
  'last_month': LAST_MONTH_SQL,
  'this_year': THIS_YEAR_SQL,
};

Map formatWorkoutData(schemaFields, rowData) {
  var formattedWorkout = new Map();
  for (var i = 0; i < schemaFields.length; i++) {
    var fieldKey = schemaFields[i].name;
    var fieldValue = rowData.f[i].v;
    formattedWorkout[fieldKey] = fieldValue;
  }
  return formattedWorkout;
}

Future<Map<String, Map>> getWorkoutData() async {
  Map<String, Map> workoutData = {};
  if (serviceAccountJson.isEmpty) {
    const serviceAccountKey = String.fromEnvironment('key');
    serviceAccountJson = serviceAccountKey;
  }

  var serviceAccountCredentials =
      new ServiceAccountCredentials.fromJson(serviceAccountJson);

  await clientViaServiceAccount(serviceAccountCredentials, _SCOPES)
      .then((httpClient) async {
    var bigqueryClient = new BigqueryApi(httpClient);

    await Future.forEach(workoutQueries.entries, (element) async {
      var query = QueryRequest();
      query.useLegacySql = false;
      query.query = element.value;
      var queryResults =
          await bigqueryClient.jobs.query(query, 'peloton-dashboard');
      var summaryRow = queryResults.rows.first;
      var formattedSummary =
          formatWorkoutData(queryResults.schema.fields, summaryRow);
      workoutData[element.key] = formattedSummary;
    });
  });
  return workoutData;
}
