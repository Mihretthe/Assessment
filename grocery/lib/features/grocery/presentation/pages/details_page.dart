import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/grocery/domain/entities/grocery.dart';
import 'package:grocery/features/grocery/presentation/widgets/price_display.dart';
import 'package:grocery/features/grocery/presentation/widgets/rating.dart';
import 'package:grocery/features/grocery/presentation/widgets/titles.dart';

class DetailsPage extends StatefulWidget {
  final Grocery grocery;
  const DetailsPage({super.key, required this.grocery});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final Map<int, bool> _selectedOptions = {};
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      height: 300,
                      widget.grocery.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                      top: 20,
                      left: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(42),
                            color: Color.fromARGB(255, 142, 134, 201)),
                        width: 42,
                        height: 42,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      )),
                  Positioned(
                    bottom: 5,
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
               Expanded(
            child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                  
                Titles(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    title: widget.grocery.title),
                PriceDisplay(
                  price: widget.grocery.price,
                  discount: widget.grocery.discount,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Rating(rating: widget.grocery.rating, fontSize: 16),
                    const Text(
                      "See all review",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFF697079),
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )
                  ],
                ),
                Text(
                  widget.grocery.description,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Color(0xFF697079)),
                ),
                SizedBox(
                  height: 20,
                ),
                widget.grocery.options.length > 0
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Titles(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              title: "Additional Options :"),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.grocery.options.length,
                            itemBuilder: (context, index) {
                              final option = widget.grocery.options[index];
                              bool value = _selectedOptions[index] ?? false;
                              return ListTile(
                                title: Text(
                                  option.name,
                                  style: TextStyle(fontSize: 16),
                                ),
                                trailing: SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      Text(
                                        '+ £ ${option.price}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Checkbox(
                                        value: value,
                                        onChanged: (bool? value) {
                                          print("Tapped");
                                          setState(() {
                                            _selectedOptions[index] =
                                                value ?? false;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      )
                    : const SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          fixedSize:
                              WidgetStateProperty.all<Size>(const Size(193, 53)),
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(8),
                          ),
                          shape: WidgetStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all<Color>(
                            const Color(0xFFFF6347),
                          ),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_bag,
                                  color: Colors.white, size: 20),
                              Text(
                                "Add to Basket",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
          ),
          ),],
        ),
        ),
      ),
    );
  }
}
