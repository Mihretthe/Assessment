import 'package:dartz/dartz.dart';
import 'package:grocery/core/error/exception.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/core/network/network_info.dart';
import 'package:grocery/features/grocery/data/data_source/local_data_source.dart';
import 'package:grocery/features/grocery/data/data_source/remote_data_source.dart';
import 'package:grocery/features/grocery/domain/entities/grocery.dart';
import 'package:grocery/features/grocery/domain/repositories/grocery_repository.dart';

class GroceryRepositoryImpl extends GroceryRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GroceryRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Grocery>>> getAllGroceries() async {
    if (await networkInfo.isConnected) {
      try {
        final groceries = await remoteDataSource.getAllGroceries();
        localDataSource.cacheGroceries(groceries);
        return Right(groceries);
      } on ServerException {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      try {
        final localGroceries = localDataSource.getAllGroceries();
        return Right(localGroceries);
      } on CacheException {
        return Left(CacheFailure(message: 'Cache Error'));
      }
    }
  }

  @override
  Future<Either<Failure, Grocery>> getGrocery(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final grocery = await remoteDataSource.getGrocery(id);
        return Right(grocery);
      } on ServerException {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      try {
        final localGrocery = localDataSource.getGrocery(id);
        return Right(localGrocery);
      } on CacheException {
        return Left(CacheFailure(message: 'Cache Error'));
      }
    }
  }
}
