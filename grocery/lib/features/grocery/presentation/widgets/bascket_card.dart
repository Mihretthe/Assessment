import 'package:flutter/material.dart';
import 'package:grocery/features/grocery/domain/entities/grocery.dart';
import 'package:grocery/features/grocery/presentation/widgets/price_display.dart';
import 'package:grocery/features/grocery/presentation/widgets/titles.dart';

class BascketCard extends StatefulWidget {
  const BascketCard({super.key, required this.grocery});
  final Grocery grocery;

  @override
  State<BascketCard> createState() => _BascketCardState();
}

class _BascketCardState extends State<BascketCard> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      SizedBox(
        width: 76.42,
        height: 75,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            widget.grocery.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Titles(fontSize: 12, fontWeight: FontWeight.w600, title: widget.grocery.title),
          PriceDisplay(price: widget.grocery.price, discount: widget.grocery.discount,),
              Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: const Color(0xFFE9EAEB)),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          count -= 1;
                                        });
                                      },
                                      icon: const Icon(Icons.remove))),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  count.toString(),
                                  style: const TextStyle(
                                      color: Color(0xFF0D1217),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: const Color(0xFFE9EAEB)),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          count += 1;
                                        });
                                      },
                                      icon: const Icon(Icons.add)))
                            ],
                          ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 0,
        right: 0,
        child: IconButton(icon: Icon(Icons.close), onPressed: (){},))

    ]);
  }
}
