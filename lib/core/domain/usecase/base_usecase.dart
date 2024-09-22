import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:karty/error/failure.dart';
 
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseWithoutEither<Type, Params> {
  Future<Type> call(Params params);
}

abstract class UseCaseWithoutEitherNoParm<Type> {
  Future<Type> call();
}

abstract class UseCaseWithoutEitherWithParm<Parm> {
  Future<void> call(Parm parms);
}

abstract class UseCaseNoParam<Type> {
  Future<Either<Failure, Type>> call();
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
