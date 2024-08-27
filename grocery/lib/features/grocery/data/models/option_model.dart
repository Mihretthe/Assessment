import 'package:grocery/features/grocery/domain/entities/option.dart';

class OptionModel extends Option{
  final String id;
  final String name;
  final double price;
  OptionModel({required this.id, required this.name, required this.price}):super(id: id, name:name, price:price);

  factory OptionModel.fromJson(Map<String, dynamic> json){
    return OptionModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble()
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'price': price
    };
  }

}