import 'package:firstproject/add_item/item_model.dart';
import 'package:firstproject/favorite/favorite_model.dart';
import 'package:firstproject/profile/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firstproject/Signup/signup.dart';
import 'SignIn/signin.dart';
import 'Splash/splash_screen.dart';

void main() {
  runApp(
      MultiProvider(providers: [

        ChangeNotifierProvider(
          create: (context) => UserModel(),
        ),

        ChangeNotifierProvider(
          create: (context) => ItemModel(),
        ),

        ChangeNotifierProvider(
          create: (context) => FavoriteModel(),
        ),

      ],
        child: MyApp(),
      )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}