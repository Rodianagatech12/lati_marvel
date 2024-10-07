import 'package:flutter/material.dart';
import 'package:lati_marvel/providers/base_provider.dart';
import 'package:lati_marvel/providers/movies_provider.dart';
import 'package:lati_marvel/screens/login_screen.dart';
import 'package:lati_marvel/screens/register_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseProvider>(
            create: (context) => BaseProvider()),
        ChangeNotifierProvider<MoviesProvider>(
            create: (context) => MoviesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Marvel',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const LoginScreen(),
        routes: {
          '/register': (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
