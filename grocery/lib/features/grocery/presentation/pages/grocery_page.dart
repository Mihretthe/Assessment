import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/grocery/presentation/bloc/blocs.dart';
import 'package:grocery/features/grocery/presentation/bloc/events.dart';
import 'package:grocery/features/grocery/presentation/bloc/states.dart';
import 'package:grocery/features/grocery/presentation/pages/details_page.dart';
import 'package:grocery/features/grocery/presentation/pages/my_basket.dart';
import 'package:grocery/features/grocery/presentation/widgets/grocery_card.dart';
import 'package:grocery/service_locator.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});
  Future<void> _refreshProducts(BuildContext context) async {
    BlocProvider.of<GroceryBloc>(context).add(GetAllGroceriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<GroceryBloc>();
        bloc.add(GetAllGroceriesEvent());
        return bloc;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset("assets/images/burger.png")),
                  Text(
                    'Burger',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                ],
              )),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<GroceryBloc, GroceryState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedAllState) {
              final groceries = state.groceries;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9EAEB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search,
                                  color: Color(0xFF0D1217))),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Color(0x001F2A37),
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 141, 149, 157),
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_list_outlined,
                                  color: Color(0xFF0D1217)))
                        ],
                      ),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => _refreshProducts(context),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0, // Spacing between columns
                            mainAxisSpacing: 8.0, // Spacing between rows
                            childAspectRatio: 0.75,
                          ),
                          itemCount: groceries.length,
                          itemBuilder: (context, index) {
                            final grocery = groceries[index];
                            return GestureDetector(
                              onTap: () {
                                // Handle the tap event here
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(grocery: grocery),
                                  ),
                                );
                                print('Tapped on ${grocery.title}');
                              },
                              child: GroceryCard(
                                discount: grocery.discount,
                                imageUrl: grocery.imageUrl,
                                price: grocery.price,
                                rating: grocery.rating,
                                title: grocery.title,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ErrorState) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No groceries available'));
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
