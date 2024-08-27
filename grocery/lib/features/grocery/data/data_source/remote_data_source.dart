import 'dart:convert';

import 'package:grocery/core/constants/constants.dart';
import 'package:grocery/features/grocery/data/models/grocery_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future <GroceryModel> getGrocery(String id);
  Future <List<GroceryModel>> getAllGroceries();
}

class RemoteDataSourceImpl extends RemoteDataSource{
  final http.Client client;
  RemoteDataSourceImpl({required this.client});
  
  @override
  Future<List<GroceryModel>> getAllGroceries() async {

    final response = await client.get(Uri.parse(Urls.baseUrl));
    if (response.statusCode == 200){
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final List<GroceryModel> groceries = [];
      for (var data in jsonData['data']){
        groceries.add(GroceryModel.fromJson(data));
      }
      
      return groceries;
      
    } else {
      throw Exception();
    }
    
  }
  
  @override
  Future<GroceryModel> getGrocery(String id) async {
    final response = await client.get(Uri.parse("${Urls.baseUrl}/$id"));
    if (response.statusCode == 200){
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      return GroceryModel.fromJson(jsonData);
    } else {
      throw Exception();
    }
  }
}