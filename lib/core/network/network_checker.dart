import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkChecker {
  Future<bool> get isNetWorkAvailable;
}

class NetworkCheckerImpl implements NetworkChecker {
  NetworkCheckerImpl(this.internetConnectionChecker);

  InternetConnectionChecker internetConnectionChecker;

  @override
  Future<bool> get isNetWorkAvailable => internetConnectionChecker.hasConnection;
}
