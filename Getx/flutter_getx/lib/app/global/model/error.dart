abstract class Failure {
  final String message = "";
}

class OperationFailure implements Failure {
  final String msg;

  OperationFailure(this.msg);

  @override
  String get message => msg;
}

class NoResultsFoundFailure implements Failure {
  @override
  String get message => "No results found.";
}

class ServerFailure implements Failure {
  final String? msg;

  ServerFailure({this.msg});

  @override
  String get message => msg ?? "Server failure. Please try again later.";
}

class UnhandledFailure implements Failure {
  @override
  String get message => "Unhandled error. Please try again later.";
}
