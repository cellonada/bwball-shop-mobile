import 'package:flutter/material.dart';
import 'package:bwball_shop/widgets/left_drawer.dart';
import 'package:bwball_shop/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({super.key});
    final List<ItemHomepage> items = [
      ItemHomepage(
        "All Products", 
        Icons.view_module, 
        const Color(0xFF0D273D),
        filterType: 'all',
      ),
      ItemHomepage(
        "My Products", 
        Icons.shopping_bag_rounded, 
        const Color(0xFF728359),
        filterType: 'my',
      ),
      ItemHomepage(
        "Create Product", 
        Icons.add_circle_outline, 
        const Color(0xFFA33C3C),
        filterType: null, 
      ),
    ];
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BWBall Shop',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        drawer: const LeftDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Welcome to BWBall Shop',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GridView.count(
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
}

class InfoCard extends StatelessWidget {
  final String title;  
  final String content; 
  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;
  final String? filterType; 

  ItemHomepage(
    this.name, 
    this.icon, 
    this.color, 
    {this.filterType} 
  );
}