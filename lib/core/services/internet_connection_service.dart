import 'package:internet_connection_checker/internet_connection_checker.dart';

final connectionService = InternetConnectionChecker.createInstance(
  slowConnectionConfig: SlowConnectionConfig(
    enableToCheckForSlowConnection: true,
    slowConnectionThreshold: const Duration(seconds: 2)
  )
);