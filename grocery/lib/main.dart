import 'package:flutter/material.dart';
import 'package:grocery/features/grocery/presentation/bloc/blocs.dart';
import 'package:grocery/features/grocery/presentation/pages/grocery_page.dart';
import 'package:grocery/features/grocery/presentation/pages/onboarding.dart';
import 'package:grocery/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUp();  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
        home: Onboarding(),  // Ensure Onboarding is a child of BlocProvider
      );
  }
}
