import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  Future<List<Map<String, dynamic>>> getProducts() async {

    final db = await openDatabase(
      'products.db',

      onCreate: (db, version) async {

        await db.execute('''
        CREATE TABLE products(
          id INTEGER PRIMARY KEY,
          name TEXT,
          description TEXT,
          price INTEGER,
          image TEXT
        )
        ''');

        await db.insert('products', {
          'name': 'iPhone',
          'description': 'iPhone is the best phone',
          'price': 5000,
          'image': 'iphone.png',
        });

        await db.insert('products', {
          'name': 'Laptop',
          'description': 'Gaming Laptop',
          'price': 4000,
          'image': 'laptop.png',
        });
      },

      version: 1,
    );

    return await db.query('products');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),

      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getProducts(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,

            itemBuilder: (context, index) {

              return Card(
                margin: EdgeInsets.all(10),

                child: ListTile(
                  leading: Icon(Icons.shopping_cart),

                  title: Text(
                    products[index]['name'],
                  ),

                  subtitle: Text(
                    products[index]['description'],
                  ),

                  trailing: Text(
                    "${products[index]['price']} SR",
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
