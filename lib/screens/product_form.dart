import 'package:flutter/material.dart';
import 'package:bwball_shop/widgets/left_drawer.dart';

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

  final List<String> _categories = [
    'Shoes',
    'Jersey',
    'Accessories',
    'Ball',
  ];

  @override
  Widget build(BuildContext context) {
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

              // === Featured Product Switch ===
              SwitchListTile(
                title: const Text("Mark as Featured Product"),
                value: _isFeatured,
                onChanged: (value) => setState(() => _isFeatured = value),
              ),

              // === Save Button ===
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus(); // unfocus keyboard
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Product saved successfully!"),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name: $_name"),
                                Text("Price: Rp${_price.toStringAsFixed(0)}"),
                                Text("Description: $_description"),
                                Text("Category: $_category"),
                                Text("Thumbnail: $_thumbnail"),
                                Text("Featured: ${_isFeatured ? "Yes" : "No"}"),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _formKey.currentState!.reset();
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
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
