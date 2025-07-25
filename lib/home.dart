import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chair), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chair), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
      body: ListView(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://i.imgur.com/QCNbOAo.png",
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.menu, size: 30),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Hello , Pino",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "What do you want to buy?",
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.grey),
                      hintText: "Search",
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Categories - horizontal scroll
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryItem(icon: Icons.chair, label: "Sofas"),
                  SizedBox(width: 16),
                  CategoryItem(icon: Icons.inventory_2, label: "Wardrobe"),
                  SizedBox(width: 16),
                  CategoryItem(icon: Icons.desk, label: "Desk"),
                  SizedBox(width: 16),
                  CategoryItem(
                    icon: Icons.chair_alt_outlined,
                    label: "Dresser",
                  ),
                  SizedBox(width: 16),
                  CategoryItem(icon: Icons.chair, label: "Chair"),
                ],
              ),
            ),
          ),

          // Product Items - vertical
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ProductItem(
              image: "https://i.imgur.com/ZgE1WxS.png",
              name: "FinnNavian",
              description:
                  "Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black",
              price: 248,
              isFavorite: true,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ProductItem(
              image: "https://i.imgur.com/3nL0zGK.png",
              name: "FinnNavian",
              description: "Scandinavian small sized wood chair for desk use",
              price: 128,
              isFavorite: false,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget: Category
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.deepPurple.shade100,
          child: Icon(icon, size: 24, color: Colors.deepPurple),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Widget: Product
class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final double price;
  final bool isFavorite;

  const ProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Image.network(image, width: 100, height: 100, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(description, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "\$$price",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Add to cart"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
        ],
      ),
    );
  }
}
