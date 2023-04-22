import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_apl/Screen/RandomApi/Provider/home_provider.dart';
import 'package:random_apl/Screen/RandomApi/view/home_screen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomeScreen(),
        },
      ),
    ),
  );
}