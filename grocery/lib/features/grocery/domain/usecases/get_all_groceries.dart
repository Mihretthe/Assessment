import 'package:dartz/dartz.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/grocery/domain/entities/grocery.dart';
import 'package:grocery/features/grocery/domain/repositories/grocery_repository.dart';

class GetAllGroceriesUseCase {
  final GroceryRepository groceryRepository;
  GetAllGroceriesUseCase({required this.groceryRepository});

  Future <Either<Failure, List<Grocery>>> call() async{
    return await groceryRepository.getAllGroceries();
  }
}