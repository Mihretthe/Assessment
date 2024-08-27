import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final String message;

  Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure{
  ServerFailure({required String message}) : super(message: message);
}



class CacheFailure extends Failure{
  CacheFailure({required String message}) : super(message: message);
}