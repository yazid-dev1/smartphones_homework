import 'package:flutter/material.dart';

void main() {
  runApp(const ProductListApp());
}

class ProductListApp extends StatelessWidget {
  const ProductListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Product Listing'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.5,
          centerTitle: true,
        ),
        body: const ProductListView(),
      ),
    );
  }
}

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  // البيانات محدثة لتطابق أسماء الملفات في مجلدك
  final List<Map<String, String>> products = const [
    {
      'name': 'iphone',
      'desc': 'iphone is the stylist phone ever',
      'price': '1000',
      'image':  'IMages2/Iphone'
    },
    {
      'name': 'Pixel',
      'desc': 'Pixel is the most featureful phone ever',
      'price': '800',
      'image': 'IMAGES\pixel.webp',
    },
    {
      'name': 'Laptop',
      'desc': 'Laptop is most productive development tool',
      'price': '2000',
      'image': 'IMAGES3/abtop.jpg', // حسب التسمية في مجلدك
    },
    {
      'name': 'Tablet',
      'desc': 'Tablet is the most useful device ever for meeting',
      'price': '1500',
      'image': 'IMAGES/tablet.jpg',
    },
    {
      'name': 'Pendrive',
      'desc': 'Pendrive is useful storage medium',
      'price': '100',
      'image': 'IMAGES/pendrive.jpg',
    },
    {
      'name': 'Floppy Drive',
      'desc': 'Floppy drive is useful rescue storage medium',
      'price': '20',
      'image': 'IMAGES/Floppy Drive.jpg', // انتبه للمسافة في الاسم
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // تغيير النوع من network إلى asset لحل مشكلة الخطأ
                Image.asset(
                  products[index]['image']!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                  // حل إضافي في حال تعذر العثور على ملف محدد
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    );
                  },
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        products[index]['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        products[index]['desc']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Price: ${products[index]['price']}',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
