import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/screens/productentry_form.dart';


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
    return Material(
      // Specify the background color of the application theme.
      color: item.color,
      // Round the card border.
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Touch-responsive area
        onTap: () {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You pressed the ${item.name} button!")));
          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Product") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductEntryFormPage()));
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
