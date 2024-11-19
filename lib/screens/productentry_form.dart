import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'package:pbp_django_auth/pbp_django_auth.dart'; // Import pbp_django_auth package
import 'dart:convert';
import 'package:ecommerce_mobile/screens/menu.dart';


class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}


class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _product = "";
	String _description = "";
	int _price = 0;
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
  appBar: AppBar(
    title: const Center(
      child: Text(
        'Add Your Product Today!',
      ),
    ),
    backgroundColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Colors.white,
  ),
  drawer: const LeftDrawer(),
  body: Form(
  key:_formKey,
  child: SingleChildScrollView(
      child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Product",
          labelText: "Product",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _product = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Product cannot be empty!";
          }
          return null;
        },
      ),
    ),
    Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Description",
      labelText: "Description",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _description = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Description cannot be empty!";
      }
      return null;
    },
  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Price",
      labelText: "Price",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _price = int.tryParse(value!) ?? 0;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Price cannot be empty!";
      }
      if (int.tryParse(value) == null) {
        return "Price must be a number!";
      }
      return null;
    },
  ),
),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                   onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          
                          final response = await request.postJson(
                            "http://localhost:8000/create-flutter/", // Ensure the URL is correct
                            jsonEncode({
                              'name': _product,        // Correct key for name
                              'price': _price,         // Correct key for price
                              'description': _description, // Correct key for description
                                        // Set the user ID, modify it as per your context
                            }),
                          );

                          if (context.mounted) {
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("New product saved successfully!")),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => MyHomePage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Something went wrong, please try again.")),
                              );
                            }
                          }
                        }
                      },

                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}