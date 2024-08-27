import 'package:grocery/features/grocery/data/models/option_model.dart';
import 'package:grocery/features/grocery/domain/entities/grocery.dart';

class GroceryModel extends Grocery{
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final double discount;
  final String description;
  final List<OptionModel> options;

  GroceryModel({required this.id, required this.title, required this.imageUrl, required this.rating, required this.price, required this.discount, required this.description, required this.options}):super(id: id, title:title, imageUrl:imageUrl, rating:rating, price:price, discount:discount, description:description, options:options);

  factory GroceryModel.fromJson(Map<String, dynamic> json){
    return GroceryModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      price: json['price'].toDouble(),
      discount: json['discount'].toDouble(),
      description: json['description'],
      options: (json['options'] as List).map((e) => OptionModel.fromJson(e)).toList()
    );
  }
  Map <String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'discount': discount,
      'description': description,
      'options': options.map((e) => e.toJson()).toList()
    };
  }
}