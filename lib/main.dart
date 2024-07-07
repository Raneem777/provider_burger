import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_burger/controller/controller.dart';
import 'package:provider_burger/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Controller(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomePage(),
        theme :ThemeData.dark(),
      ),
    );
  }
}

