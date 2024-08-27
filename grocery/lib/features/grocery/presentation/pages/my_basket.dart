import 'package:flutter/material.dart';
import 'package:grocery/features/grocery/domain/entities/grocery.dart';
import 'package:grocery/features/grocery/presentation/pages/grocery_page.dart';
import 'package:grocery/features/grocery/presentation/widgets/bascket_card.dart';

class MyBasket extends StatefulWidget {
  const MyBasket({super.key});

  @override
  State<MyBasket> createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "My basket",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: 22),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Order Summary",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      side: const BorderSide(
                        color: Color(0xFFFF6347),
                        width: 2,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Add Items",
                        style: TextStyle(
                          color: Color(0xFFFF6347),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                    
                 ] ),
                 BascketCard(grocery: Grocery(id: "id", title: "Chicken Burger", imageUrl: "assets/images/splash.png", rating: 5, price: 10, discount: 4, description: "description", options: [])),
                 BascketCard(grocery: Grocery(id: "id", title: "Chicken Burger", imageUrl: "assets/images/splash.png", rating: 5, price: 10, discount: 4, description: "description", options: [])),
                 BascketCard(grocery: Grocery(id: "id", title: "Chicken Burger", imageUrl: "assets/images/splash.png", rating: 5, price: 10, discount: 4, description: "description", options: [])),
                 BascketCard(grocery: Grocery(id: "id", title: "Chicken Burger", imageUrl: "assets/images/splash.png", rating: 5, price: 10, discount: 4, description: "description", options: [])),
                 BascketCard(grocery: Grocery(id: "id", title: "Chicken Burger", imageUrl: "assets/images/splash.png", rating: 5, price: 10, discount: 4, description: "description", options: [])),
          
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
                                "Place Order",
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
        )
          
        ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (int index) {
          if (index == 0) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const GroceryPage()));
          } else if (index == 1) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyBasket()));
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          )
        ],
      ),
    );
  }
}
