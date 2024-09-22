import 'package:equatable/equatable.dart';
import 'package:karty/error/network_constant.dart';
 
abstract class Failure extends Equatable {
  const Failure();
}

class ServerFailure extends Failure {
  const ServerFailure({this.message});

  final String? message;
  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class FailureToMassage {
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return (failure as ServerFailure).message ??
            NetworkString.serverFailureMessage;
      case CacheFailure:
        return NetworkString.cacheFailureMessage;
      case NetworkFailure:
        return NetworkString.networkFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
