import 'package:grocery/features/grocery/domain/entities/grocery.dart';

class GroceryState {}

class InitialState extends GroceryState{}

class LoadingState extends GroceryState{}

class LoadedAllState extends GroceryState{
  final List<Grocery> groceries;
  LoadedAllState({required this.groceries});
}

class ErrorState extends GroceryState{
  final String message;
  ErrorState({required this.message});
}