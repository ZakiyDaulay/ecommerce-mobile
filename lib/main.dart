import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'package:pbp_django_auth/pbp_django_auth.dart'; // Import pbp_django_auth package
import 'package:ecommerce_mobile/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest(); // Create a CookieRequest instance
        return request;
      },
      child: MaterialApp(
        title: 'The Swag Store',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(secondary: Colors.green[400]),
        ),
        home: LoginPage(), // Your home widget
      ),
    );
  }
}
