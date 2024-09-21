import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get getMessage;
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});

  @override
  String get getMessage => message;
  @override
  List<Object?> get props => [message, getMessage];
}

class EmptyCacheFailure extends Failure {
  final String message;

  EmptyCacheFailure({required this.message});

  @override
  String get getMessage => message;
  @override
  List<Object?> get props => [message, getMessage];
}

class OfflineFailure extends Failure {
  final String message;
  OfflineFailure({required this.message});

  @override
  String get getMessage => message;

  @override
  List<Object?> get props => [message, getMessage];
}
