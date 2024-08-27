import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/grocery/domain/entities/grocery.dart';
import 'package:dartz/dartz.dart';


abstract class GroceryRepository{
  Future<Either<Failure, Grocery>> getGrocery(String id);
  Future<Either<Failure, List<Grocery>>> getAllGroceries();
}