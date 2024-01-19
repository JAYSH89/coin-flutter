import 'package:equatable/equatable.dart';

class ConnectionException implements Exception, Equatable {
  final String message;

  ConnectionException({this.message = 'Server error occurred'});

  @override
  // TODO: implement props
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}

class DatabaseException implements Exception, Equatable {
  final String message;

  DatabaseException({this.message = 'Server error occurred'});

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}

class ServerException implements Exception, Equatable {
  final String message;

  ServerException({this.message = 'Server error occurred'});

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}
