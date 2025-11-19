import 'package:flutter/material.dart';
import 'package:bwball_shop/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:bwball_shop/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  double _price = 0;
  String _description = "";
  String _category = "Shoes";
  String _thumbnail = "";
  bool _isFeatured = false;
  int _stock = 0;          
  int _rating = 0;         
  bool _isFavorite = false;

  final List<String> _categories = [
    'Shoes',
    'Jersey',
    'Accessories',
    'Ball',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Product Name ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onChanged: (value) => setState(() => _name = value),
                onSaved: (value) => _name = value ?? "",
                validator: (value) {
                  if (value == null || value.isEmpty) return "Name cannot be empty!";
                  if (value.length < 3) return "Name is too short!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === Product Price ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Product Price (Rp)",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() => _price = double.tryParse(value) ?? 0),
                onSaved: (value) => _price = double.tryParse(value ?? "0") ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Price cannot be empty!";
                  final num? price = num.tryParse(value);
                  if (price == null || price <= 0) return "Price must be greater than 0!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // ✅ === Stock ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Stock Quantity",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() => _stock = int.tryParse(value) ?? 0),
                onSaved: (value) => _stock = int.tryParse(value ?? "0") ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Stock cannot be empty!";
                  final stock = int.tryParse(value);
                  if (stock == null || stock < 0) return "Stock must be 0 or more!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === Description ===
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Product Description",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onChanged: (value) => setState(() => _description = value),
                onSaved: (value) => _description = value ?? "",
                validator: (value) {
                  if (value == null || value.isEmpty) return "Description cannot be empty!";
                  if (value.length < 10) return "Description must be at least 10 characters!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === Category ===
              DropdownButtonFormField<String>(
                value: _category,
                decoration: InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                items: _categories
                    .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (newValue) => setState(() => _category = newValue!),
              ),
              const SizedBox(height: 12),

              // === Thumbnail URL ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Product Thumbnail URL",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onChanged: (value) => setState(() => _thumbnail = value),
                onSaved: (value) => _thumbnail = value ?? "",
                validator: (value) {
                  if (value == null || value.isEmpty) return "URL cannot be empty!";
                  final urlPattern = r'^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$';
                  if (!RegExp(urlPattern).hasMatch(value)) return "Please enter a valid URL!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === Rating ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Product Rating (0-5)",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() => _rating = int.tryParse(value) ?? 0),
                onSaved: (value) => _rating = int.tryParse(value ?? "0") ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Rating cannot be empty!";
                  final rating = int.tryParse(value);
                  if (rating == null) return "Rating must be a number!";
                  if (rating < 0 || rating > 5) return "Rating must be between 0-5!";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              
              //=== Favorite Product Switch ===
              SwitchListTile(
                title: const Text("Mark as Favorite Product"),
                value: _isFavorite,
                onChanged: (value) => setState(() => _isFavorite = value),
              ),

              const SizedBox(height: 20),

              // === Save Button ===
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                  ),
                  onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        final response = await request.postJson(
                          "http://localhost:8000/create-flutter/",
                          jsonEncode({
                            "name": _name,
                            "price": _price.toInt(),
                            "description": _description,
                            "category": _category,
                            "thumbnail": _thumbnail,
                            "is_featured": _isFeatured,
                            "is_favorite": _isFavorite,  
                            "stock": _stock,          
                            "rating": _rating,        
                          }),
                        );

                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Product successfully saved!")),
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
                  child: const Text("Save", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}