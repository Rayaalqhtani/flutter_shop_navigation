import 'package:flutter/material.dart';

class Product {
  final String name;
  final String desc;
  final double price;
  final String image;

  Product({required this.name, required this.desc, required this.price, required this.image});
}


class Exercise2Screen extends StatefulWidget {
  const Exercise2Screen({super.key});

  @override
  State<Exercise2Screen> createState() => _Exercise2ScreenState();
}

class _Exercise2ScreenState extends State<Exercise2Screen> {
  final List<Product> products = [
    Product(name: 'قهوة عربية', desc: 'هيل وزعفران', price: 15, image: '☕'),
    Product(name: 'قهوة بالحليب', desc: 'حليب طازج ورغوة', price: 18, image: '🥛'),
    Product(name: 'نسكافيه', desc: 'قهوة سريعة التحضير', price: 20, image: '☕'),
    Product(name: 'شاي أحمر', desc: 'مع نعناع طازج', price: 10, image: '🍵'),
    Product(name: 'كيكة فراولة', desc: 'فراولة وكريمة', price: 12, image: '🍰'),
    Product(name: 'كرواسون', desc: 'طازج بالزبدة', price: 8, image: '🥐'),
    

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5E6), 
      appBar: AppBar(
        title: const Text(
          '☕ قائمة المنتجات',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF8B4513), 
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: const Color(0xFF8B4513).withOpacity(0.1),
                child: Text(
                  product.image,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              title: Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    product.desc,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                 Text(
  '\$${product.price.round()}',
  textDirection: TextDirection.ltr,
  style: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xFF8B4513),
    fontSize: 14,
  ),
),
                ],
              ),
              trailing: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B4513).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF8B4513),
                ),
              ),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(product: product),
                  ),
                );

                if (result != null && mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(result),
                      backgroundColor: const Color(0xFF8B4513),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}


class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5E6),
      appBar: AppBar(
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF8B4513),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF8B4513).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Text(
                product.image,
                style: const TextStyle(fontSize: 70),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B4513),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product.desc,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF8B4513).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
  '\$${product.price.round()}',
  textDirection: TextDirection.ltr,
  style: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xFF8B4513),
    fontSize: 22,
  ),
),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, '✅ تم الرجوع من ${product.name}');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B4513),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'رجوع مع تأكيد',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}