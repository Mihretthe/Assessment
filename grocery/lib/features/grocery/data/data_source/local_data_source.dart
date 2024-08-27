import 'dart:convert';

import 'package:grocery/features/grocery/data/models/grocery_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource{
  List<GroceryModel> getAllGroceries();
  Future <void> cacheGroceries(List<GroceryModel> groceries);
  GroceryModel getGrocery(String id);
}

class LocalDataSourceImpl implements LocalDataSource{

  final SharedPreferences sharedPreferences;
  LocalDataSourceImpl({required this.sharedPreferences});
  var keyName = 'cache';

  List<GroceryModel> _toList(String? response){

    List<GroceryModel> groceries = [];
    if (response != null){
      var jsonList = json.decode(response);
      for (var data in jsonList){
        groceries.add(GroceryModel.fromJson(data));
      }
      return groceries;
    }
    return [];

  }

  @override
  Future<void> cacheGroceries(List<GroceryModel> groceries) async{
    var mapped = groceries.map((model) => model.toJson()).toList();
    var jsonMap = json.encode(mapped);
    bool response = await sharedPreferences.setString(keyName, jsonMap);

    if (response == false){
      throw Exception('Error');
    }
  }

  @override
  List<GroceryModel> getAllGroceries() {
    var response = sharedPreferences.getString(keyName);
    if (response != null){
      return _toList(response);
    }
    return [];
  }

  @override
  GroceryModel getGrocery(String id) {
    var response = sharedPreferences.getString(keyName);
    if (response != null){
      var groceries = _toList(response);
      for (var grocery in groceries){
        if (grocery.id == id){
          return grocery;
        }
      }
    }
    throw Exception('No Grocery Found');
  }

  
}