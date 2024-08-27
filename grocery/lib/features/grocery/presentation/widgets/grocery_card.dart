import 'package:flutter/material.dart';
import 'package:grocery/features/grocery/presentation/widgets/price_display.dart';
import 'package:grocery/features/grocery/presentation/widgets/rating.dart';
import 'package:grocery/features/grocery/presentation/widgets/titles.dart';

class GroceryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final double discount;
  const GroceryCard(
      {super.key,
      required this.discount,
      required this.imageUrl,
      required this.price,
      required this.rating,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      // height: 180,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 0.5,
          ),
        ],
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      height: 120,
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 6,
                    
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Icon(
                            size: 22,
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                      ),
                    ),
                  )
                ],
              ),
            
            Align(
              alignment: Alignment.centerLeft,
              child: Titles(fontSize: 18, fontWeight: FontWeight.w500, title: title)),
            Rating(rating: rating, fontSize: 16),
            PriceDisplay(price:price, discount: discount),
          ],
        
      ),
    );
  }
}
