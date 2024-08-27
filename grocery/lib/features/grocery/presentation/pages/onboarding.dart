import 'package:flutter/material.dart';
import 'package:grocery/features/grocery/presentation/pages/grocery_page.dart';
class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
   
    Future.delayed(Duration(seconds: 5), () async {
      
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return GroceryPage();
          }),
            
          
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    
            
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("Welcome to",style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                      ),),
                ),
                SizedBox(
                  width: 312,
                  height: 38,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'SPEEDY CHOW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 41,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Roboto',
                      ),
                  
                    ),
                  ),
                ),
                SizedBox(height: 100,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
