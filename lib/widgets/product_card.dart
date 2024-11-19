import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/screens/productentry_form.dart';
import 'package:ecommerce_mobile/screens/list_productentry.dart';

import 'package:provider/provider.dart'; // Import Provider package
import 'package:pbp_django_auth/pbp_django_auth.dart'; // Import pbp_django_auth package

import 'package:ecommerce_mobile/screens/login.dart'; // Add this line if LoginPage is in a separate file

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;
  
  ItemHomepage(this.name, this.icon,this.color);//added color property for the itemhompage
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key}); 

 @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      // Specify the background color of the application theme.
      color: item.color,
      // Round the card border.
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Touch-responsive area
        onTap: () async {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You pressed the ${item.name} button!")));
          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Product") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductEntryFormPage()));
          }else if (item.name == "View Product") {
            // Navigate to ProducEntryPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductEntryPage()),
            );
          }else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
                "http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
                if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message Goodbye, $uname."),
                    ));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(message),
                        ),
                    );
                }
            }
          }
          
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
