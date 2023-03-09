import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example3/provider/favourite_provider.dart';

import 'screens/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavouriteProvider(),
      child: MaterialApp(
        home: FavouriteScreen(),
      ),
    );
  }
}
