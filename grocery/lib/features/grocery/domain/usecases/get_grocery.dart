import 'package:dartz/dartz.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/grocery/domain/entities/grocery.dart';
import 'package:grocery/features/grocery/domain/repositories/grocery_repository.dart';

class GetGroceryUseCase{
  final GroceryRepository groceryRepository;
  GetGroceryUseCase({required this.groceryRepository});

  Future <Either<Failure, Grocery>> call (String id) async{
    return await groceryRepository.getGrocery(id);
  }
  
}