import 'package:ecommerce_mobile/screens/productentry_form.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/screens/menu.dart';



class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
    ),
    child: const Column(
      children: [
        Text(
          'The Swag Store',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Padding(padding: EdgeInsets.all(8)),
        Text(
          "Buy all the stuff you want",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              color: Colors.white,
                ),
        ),
      ],
    ),
          ),
            ListTile(
    leading: const Icon(Icons.home_outlined),
    title: const Text('Home Page'),
    // Redirection part to MyHomePage
    onTap: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ));
    },
  ),
  ListTile(
    leading: const Icon(Icons.add),
    title: const Text('Add Product'),
    // Redirection part to ProductentryFormpage
    onTap: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProductEntryFormPage(),
          ));
    },
  ),
        ],
      ),
    );
  }
}